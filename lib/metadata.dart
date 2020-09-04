import 'package:cochl_sense/constant.dart';

class Metadata {
  String apiKey;
  String format;
  bool smartFiltering;

  Metadata() {
    apiKey = "";
    format = "";
    smartFiltering = false;
  }

  Metadata withApiKey(String key) {
    this.apiKey = key;
    return this;
  }

  Metadata withFileFormat(String format) {
    this.format = format;
    return this;
  }

  Metadata withStreamFormat(String format, int samplingRate) {
    this.format = 'PCM(${format},${samplingRate},1)';
    return this;
  }

  Metadata withSmartFiltering(bool smartFiltering) {
    this.smartFiltering = smartFiltering;
    return this;
  }

  Map<String, String> toGRPCMetadata() {
    Map<String, String> metadata = {
      API_VERSION_METADATA: API_VERSION,
      USER_AGENT_METADATA: USER_AGENT,
      API_KEY_METADATA: this.apiKey,
      FORMAT_METADATA: this.format
    };

    if (this.smartFiltering) {
      metadata[SMART_FILTERING_METADATA] = "true";
    }

    return metadata;
  }
}
