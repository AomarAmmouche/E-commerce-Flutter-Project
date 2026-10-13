import 'package:device_preview/device_preview.dart';
import 'package:ecommerce_dashboard/features/app/presentation/screens/app.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
         home:  App(),
         debugShowCheckedModeBanner: false,
    );
  }
}
