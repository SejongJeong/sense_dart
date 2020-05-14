import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
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
    ..withReader("example/test_samples/a.wav")
    ..withFormat("wav")
  ).build();

  final res = await testFile.inference();

  //final resultJSON = json.encode(res.toJson());

 //  Check the respose meesage
  //print(resultJSON.service());
 // print(resultJSON.allEvents());
    print(res);
   print(res.runtimeType);
//  print(resultJSON.detectedTags());
//  print(resultJSON.detectedTags());


  // --------------------- Test Stream Analysis -------------------
// sample float32 Mono 22050 audio raw file
  Stream<List<int>> makeStream(String fileName) async* {
    // This method make Stream by aligning chunksize
    // You can just use File().openread()
    final int MAX_DATA_SIZE = 22050;
    num i = 0;
    var audioByte = await File(fileName).readAsBytes();
    num st = 0;
    num end = 0;
    if (audioByte.length < MAX_DATA_SIZE) {
      end = audioByte.length;
    } else {
      end = MAX_DATA_SIZE;
    }
    while (true) {
      if (i != 0) {
        st += MAX_DATA_SIZE;
        end += MAX_DATA_SIZE;
      }
      if (end > audioByte.length && st < audioByte.length) {
        end = audioByte.length;
      } else if (end > audioByte.length && st > audioByte.length) {
        return;
      }
      List<int> temp = audioByte.sublist(st, end);
      i++;
      yield temp;
    }
  }

  var testStreamData = makeStream('example/test_samples/a.raw');
  //var testStreamData = File('example/test_samples/a.raw').openRead();

  var testStream = (streamBuilder()
    ..withApiKey(APIKey)
    ..withStreamer(testStreamData)
    ..withSamplingRate(22050)
    ..withDataType("float32")
    ..withMaxEventsHistorySize(0)
  ).build();

  Stream<Result> resStream = testStream.inference();

  // return final Result Instance
//    Result temp = await resStream.last;
//    print (temp.detectedEvents());

  // return every Result Instance
  print("Stream Inference : \n");
  resStream.listen((Result result) {
    print(result);
  });
}
