import 'package:flutter/services.dart';

class AppConfig {

  Future initConfig() async {
    try {
      String data = await rootBundle.loadString('assets/config/config.json');
    } catch (e) {
      throw Exception("${e.toString()} Failed To Load Theme File");
    }
    return this;
  }
}
