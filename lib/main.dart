import 'package:flutter/material.dart';
import 'package:resume_builder_app/utiles/routes_utiles.dart';
import 'package:resume_builder_app/views/screens/home_page.dart';
import 'package:resume_builder_app/views/screens/resume_view_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        AllRoutes.homePage: (context) => HomePage(),
        AllRoutes.previewPage: (context) => ResumePreviewPage(),
      },
    );
  }
}
