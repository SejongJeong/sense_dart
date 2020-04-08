# sense_dart

API Library for Dart with audio analysis and recognition solutions from Cochlear.ai

## Overview

Sense API enables developers to extract various non-verbal information from an audio input with the power of audio processing and neural network techniques. It is robust against noises and different types of recording environments, so it can be used for analyzing input audio from various IoT devices such as smart speakers or IP cameras, not to mention its potential usage in searching through video clips.

To date, Sense API is the only publicly available API online for machine listening, a rapidly emerging technology. It supports both prerecorded audio and real-time streaming as inputs, and multiple audio encodings are supported including mp3, wav, and FLAC.


## Get started

### 1. Add Dependency

**Add this to your package's pubspec.yaml file:**

  
  ```yaml

  dependencies:
    sense_dart: ^0.0.3+1

  ```
	
### 2. Install it

You can install packages from the command line:

with pub:

```shell

$ pub get


```

with Flutter:

```shell

$ flutter pub get


```

Alternatively, your editor might support  `pub get`  or  `flutter pub get`. Check the docs for your editor to learn more.

### 3. Import it

Now in your Dart code, you can use:

```dart

import 'package:sense_dart/sense_dart.dart';

```

### 4. Get API Key

Go to https://cochlear.ai/beta-subscription/

Then enter and submit an email to receive the key and get a Beta Key.

During the beta-version testing period, there is a daily quota on the number of files/length of streaming that you can use.
Daily Quota - 
	 700 calls per method (audio file) / 10 minutes per method (audio stream)

Daily quotas are refreshed at the end of a 24-hour window (GMT+0).


## Usage

**Import the library.**
```dart
import 'package:sense_dart/sense_dart.dart';

final  apiKey  =  "Copy Your Cochlear API Beta Key Received by Email";
```
**Sampling rate : 22050Hz**
To have the best result, we recommend sending us an audio input with a sampling rate greater than 22050Hz.
If your audio file is sampled below this value, don’t resample it by yourself: our system supports it as well.

**Minimum length : 1 second**
Audio that we analyze needs to be at least 1 second long.


 **1. Analyze audio files**

Audio file format must be one of mp3, flac, wav, ogg, mp4.

Future<String>  sense(filename, apiKey, fileFormat, taskInput) async {}

Enter the format of the audio file you want to use into fileFormat in String.
And enter the 'event' into taskInput.

task  can take one of the following values - 

    'event'

    'speech' #SUPPORTS INCOMING

    'music' #SUPPORTS INCOMING


**2. Analyze audio stream**
Stream<String>  senseStream(inputData, apiKey, taskInput) async* {}

The inputData must be PCM_Float and the sample rate must be 22050.
And enter the 'event' into taskInput.

task  can take one of the following values - 

    'event'

    'speech' #SUPPORTS INCOMING

    'music' #SUPPORTS INCOMING

**Result JSON Format**
```json
{
  "status": {
    "code": 200,
    "description": "OK"
  },
  "result": {
    "task": "event",
    "frames": [
      {
        "tag": "Laughter",
        "probability": 0.9042,
        "start_time": 0,
        "end_time": 1
      },
      {
        "tag": "Baby_cry",
        "probability": 0.8802,
        "start_time": 0.5,
        "end_time": 1.5
      },
      {
        "tag": "Laughter",
        "probability": 0.7,
        "start_time": 1,
        "end_time": 2
      },
      {
        "tag": "Baby_cry",
        "probability": 0.8978,
        "start_time": 1.5,
        "end_time": 2.5
      },
      {
        "tag": "Baby_cry",
        "probability": 0.695,
        "start_time": 2,
        "end_time": 3
      }
    ],
    "summary": [
      {
        "tag": "Laughter",
        "probability": 0.9042,
        "start_time": 0,
        "end_time": 1
      },
      {
        "tag": "Baby_cry",
        "probability": 0.8802,
        "start_time": 0.5,
        "end_time": 1.5
      },
      {
        "tag": "Laughter",
        "probability": 0.7,
        "start_time": 1,
        "end_time": 2
      },
      {
        "tag": "Baby_cry",
        "probability": 0.7964,
        "start_time": 1.5,
        "end_time": 3
      }
    ]
  }
}
```

