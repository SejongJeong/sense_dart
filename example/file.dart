import '../lib/cochl_sense.dart' as sense;
import 'dart:io';

void main() async {
  final apiKey = "< Enter API Key> ";
  final filePath = "resources/siren.wav";
  final format = "wav";

  final fileData = File(filePath).readAsBytesSync();

  var file = sense.FileBuilder()
      .withApiKey(apiKey)
      .withReader(fileData)
      .withFormat(format)
      .withSmartFiltering(true)
      .build();

  final fileResult = await file.inference();
  print(fileResult.detectedEventsTiming());
}
