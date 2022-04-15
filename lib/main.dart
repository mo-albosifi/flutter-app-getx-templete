import 'package:flutter/material.dart';
import 'package:flutter_app_getx_templete/app/my_app.dart';
import 'package:flutter_app_getx_templete/core/config/app_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfig.init();
  runApp(const MyApp());
}

