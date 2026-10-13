import 'package:device_preview/device_preview.dart';
import 'package:ecommerce_dashboard/layout/home/presentation/screens/home_page.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(
    DevicePreview(
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
         home:  HomePage(),
         debugShowCheckedModeBanner: false,
    );
  }
}
