import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const MyApp());
  }, (error, stack) {
    log(error.toString(), stackTrace: stack);
  });
}
