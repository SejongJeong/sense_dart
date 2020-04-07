import 'dart:io';
import 'dart:convert';
import 'sample_data.dart';
import 'dart:collection';
import '../lib/sense_dart.dart';

void main() async {
  final APIKey = "";
  var streamData = new Queue<List<double>>();

  void audioDataBuffering(int second) async {
    for (int i = 0; i < second; i++) {
      streamData.add(sample_data);
    }
  }

  Stream<List<double>> audioDataGenerator() async* {
    while (streamData.length > 0) {
      yield streamData.removeFirst();
    }
  }

  final result = await InternetAddress.lookup(hostAddress);
  print(result.isNotEmpty);
  print(result[0].rawAddress.isNotEmpty);

   final res = await sense("test.wav", APIKey, "wav", "event");
   final resultJSON = json.decode(res);

  // Check the respose meesage
   print(resultJSON["status"]["code"]);
   final summary = resultJSON['result']['summary'];
  print(summary[1]['tag']);

  audioDataBuffering(100);

  Stream<String> resStream =
      senseStream(audioDataGenerator(), APIKey, "event");
  resStream.listen((res) {
    final resultJSON = json.decode(res);
    // Check the respose meesage
   // print(resultJSON["status"]["code"]);
    final frames = resultJSON['result']['frames'];
    //print(frames[0]['tag']);
    print(resultJSON);
  });
}
