import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:shoopping_oa/features/app/presentation/screens/app.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: App(),
    );
  }
}
