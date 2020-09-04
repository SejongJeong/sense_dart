import '../lib/cochl_sense.dart' as sense;
import 'dart:io';

void main() async {
  final apiKey = "< Enter API Key >";
  final streamPath = "resources/siren.raw";

  final streamData = File(streamPath).openRead();

  var stream = sense.StreamBuilder()
      .withApiKey(apiKey)
      .withStreamer(streamData)
      .withDataType("float32")
      .withSamplingRate(22050)
      .withSmartFiltering(true)
      .build();

  final streamResult = stream.inference();
  streamResult.listen((event) {
    print(event.detectedEventsTiming());
  });
}
