import 'dart:io';
import 'package:sense_dart/sense_dart.dart';


void main() async {
  final APIKey = "< Enter Your API Key >";

  // Check API Connection
  final result = await InternetAddress.lookup("sense.cochlear.ai");
  print(result.isNotEmpty);
  print(result[0].rawAddress.isNotEmpty);


  // ------------------ Test File Analysis ------------------------
  var testFile = (fileBuilder()
  ..withApiKey(APIKey)
  ..withReader("example/test_samples/temp.wav")
  ..withFormat("wav")
  ).build();

  final res = await testFile.inference();
  final resultJSON = res;

  print(resultJSON.runtimeType);

 //  Check the respose meesage
  print(resultJSON.service());
  print(resultJSON.allEvents());
//  print(resultJSON.detectedEventsTiming());
//  print(resultJSON.detectedTags());
// for (var event in resultJSON.detectedEvents()) {
//   print(event);
// }

  // --------------------- Test Stream Analysis -------------------
// sample float32 Mono 22050 audio raw file
  var tempStreamData = File('example/test_samples/a.raw').openRead();
  var testStream = (streamBuilder()
  ..withApiKey(APIKey)
  ..withStreamer(tempStreamData)
  ..withSamplingRate(22050)
  ..withDataType("float32")
  ).build();

  Stream resStream = testStream.inference();

  // return final Result Instance
//  Result temp = await resStream.last;
//  print (temp.detectedEvents());

  // return every Result Instance
  print("Stream Inference : \n");
  resStream.listen((event) {
    print(event);
  });
}
