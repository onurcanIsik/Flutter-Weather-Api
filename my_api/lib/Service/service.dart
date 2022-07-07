import 'dart:convert';
import 'dart:io';

import 'package:my_api/Model/model.dart';

const url =
    "https://api.openweathermap.org/data/2.5/weather?q=canada&appid=dead90bf995cc1ac21d209339db194e8";

Future<Main> pasrejson() => HttpClient()
    .getUrl(Uri.parse(url))
    .then((value) => value.close())
    .then((response) => response.transform(Utf8Decoder()).join())
    .then((str) => json.decode(str) as Map<String, dynamic>)
    .then((datamap) => datamap['main'] as Map<String, dynamic>)
    .then(
      (json) => Main.fromJson(json),
    );
