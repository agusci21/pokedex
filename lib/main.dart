import 'package:flutter/material.dart';
import 'package:flutter_template/application/application.dart';
import 'package:flutter_template/infrastructure/environments_confi.dart';
import 'package:flutter_template/infrastructure/ioc_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvironmentConfig.init();
  IocManager.register();
  runApp(const Application());
}
