import 'dart:convert';

class Event {
  var tag;
  var probability;
  var startTime;
  var endTime;

  Event(json) {
    this.tag = json['tag'];
    this.probability = json['probablility'];
    this.startTime = json['start_time'];
    this.endTime = json['end_time'];
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
  var rawJson;
  var result;
  var _service;
  List<Event> _event;

  Result(String raw) {
    this.rawJson = json.decode(raw);
    this.result = this.rawJson["result"];
    this._service = this.result["task"];
    this._event = List<Event>();
    List<dynamic> tempEvent =
        result["frames"] != null ? List.from(result["frames"]) : null;
    for (var value in tempEvent) {
      value = Event.fromJson(value);
      this._event.add(value);
    }
  }

  Result.empty() {
    this.rawJson = null;
    this.result = null;
    this._service = null;
    this._event = List<Event>();
  }

  Map<String, dynamic> toJson() => {
        "events": allEvents(),
        "service": service(),
      };

  String toString() {
    return _event.toString();
  }

  bool filter(Event event) {
    return useDefaultFilter(event);
    // Implement Your Filter Code
    /*if (event.tag == '') {
      return true;
    }
    else return false;*/
  }

  bool useDefaultFilter(Event event) {
    return defaultEventFilter(event);
  }

  String service() {
    return this._service;
  }

  List<Event> allEvents() {
    return this._event;
  }

  List<Event> detectedEvents() {
    List<Event> tempList = allEvents();
    tempList.retainWhere((element) => filter(element));
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

  List<Event> appendNewResult(String raw, int maxStoredEvents) {
    var newRawjson = json.decode(raw);
    var newResult = newRawjson['result'];
    this._service = newResult['task'];
    List<Event> newEvent = List<Event>();
    List<dynamic> tempEvent =
        newResult["frames"] != null ? List.from(newResult["frames"]) : null;
    for (var value in tempEvent) {
      value = Event.fromJson(value);
      newEvent.add(value);
    }
    if (maxStoredEvents < _event.length) {
      this._event =
          this._event.sublist(_event.length - maxStoredEvents, _event.length);
    }
    this._event += newEvent;
    return this._event;
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
