import 'dart:math';

import './proto/SenseClient.pb.dart' as Grpc;

class Event {
  var tag;
  var probability;
  var startTime;
  var endTime;

  Event._(Grpc.Event raw) {
    this.tag = raw.tag;
    this.probability = raw.probability;
    this.startTime = raw.startTime;
    this.endTime = raw.endTime;
  }

  Event.fromJson(Map<String, dynamic> json)
      : tag = json['tag'],
        probability = json['probability'],
        startTime = json['start_time'],
        endTime = json['end_time'];

  Map<String, dynamic> toJson() => {
        'tag': tag,
        'probability': probability,
        'start_time': startTime,
        'end_time': endTime,
      };

  @override
  String toString() {
    return "(tag: ${this.tag}, probability: ${this.probability}, start_time: ${this.startTime}, end_time: ${this.endTime})";
  }
}

bool defaultEventFilter(Event event) {
  return true;
}

class Result {
  var _service;
  bool Function(Event) _filter;

  List<Event> _events;

  Result(Grpc.CochlSense raw) {
    this._service = raw.service;
    this._filter = defaultEventFilter;
    this._events = raw.events.map((e) => Event._(e)).toList();
  }

  Map<String, dynamic> toJson() => {
        "events": allEvents(),
        "service": service(),
      };

  String toString() {
    return _events.toString();
  }

  Result withFilter(bool Function(Event) filter) {
    this._filter = filter;
    return this;
  }

  String service() {
    return this._service;
  }

  List<Event> allEvents() {
    return this._events;
  }

  List<Event> detectedEvents() {
    List<Event> tempList = allEvents();
    tempList.retainWhere((element) => _filter(element));
    return tempList;
  }

  List detectedTags() {
    List tags = List();
    for (Event frame in detectedEvents()) {
      tags.add(frame.tag);
    }
    return tags;
  }

  Map detectedEventsTiming() {
    Map summary = Map();
    for (Event event in detectedEvents()) {
      List timing;
      if (summary[event.tag] == null) {
        timing = [];
      } else {
        timing = summary[event.tag];
      }
      timing.add([event.startTime, event.endTime]);
      summary[event.tag] = timing;
    }
    summary.updateAll((key, value) => _mergeOverlappingEvents(value));
    return summary;
  }

  List<Event> appendNewResult(Grpc.CochlSense raw, int maxStoredEvents) {
    List<Event> newEvents = raw.events.map((e) => Event._(e)).toList();

    num indexFilter = max(0, this._events.length - maxStoredEvents);
    this._events = this._events.sublist(indexFilter) + newEvents;

    return this._events;
  }

  List _mergeOverlappingEvents(List times) {
    if (times.isEmpty) {
      return [];
    }
    times.sort((a, b) => a[0].compareTo(b[0]));
    List merged = [times[0]];
    for (var time in times.getRange(1, times.length)) {
      var last = merged.last;
      if (time[0] > last[1]) {
        merged.add(time);
        continue;
      }
      if (time[1] > last[1]) {
        merged.last = [last[0], time[1]];
      }
    }
    return merged;
  }
}
