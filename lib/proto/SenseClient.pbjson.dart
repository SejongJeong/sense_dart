///
//  Generated code. Do not modify.
//  source: SenseClient.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const Audio$json = const {
  '1': 'Audio',
  '2': const [
    const {'1': 'data', '3': 1, '4': 1, '5': 12, '10': 'data'},
    const {'1': 'segmentOffset', '3': 2, '4': 1, '5': 3, '10': 'segmentOffset'},
    const {'1': 'segmentStartTime', '3': 3, '4': 1, '5': 1, '10': 'segmentStartTime'},
  ],
};

const Event$json = const {
  '1': 'Event',
  '2': const [
    const {'1': 'tag', '3': 1, '4': 1, '5': 9, '10': 'tag'},
    const {'1': 'startTime', '3': 2, '4': 1, '5': 1, '10': 'startTime'},
    const {'1': 'endTime', '3': 3, '4': 1, '5': 1, '10': 'endTime'},
    const {'1': 'probability', '3': 4, '4': 1, '5': 1, '10': 'probability'},
  ],
};

const CochlSense$json = const {
  '1': 'CochlSense',
  '2': const [
    const {'1': 'service', '3': 1, '4': 1, '5': 9, '10': 'service'},
    const {'1': 'events', '3': 2, '4': 3, '5': 11, '6': '.sense.full.v1.Event', '10': 'events'},
  ],
};

