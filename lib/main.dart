import 'package:flutter/material.dart';
import 'package:flutter_app_getx_templete/app/my_app.dart';
import 'package:flutter_app_getx_templete/core/app_initialization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitialization.init();
  runApp(const MyApp());
}

