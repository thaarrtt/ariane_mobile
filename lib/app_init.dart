import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loggy/loggy.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> appInit() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Hive.initFlutter();

  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(),
  );

  FlutterNativeSplash.remove();
}
