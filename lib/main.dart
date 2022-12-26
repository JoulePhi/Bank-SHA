import 'package:bank_sha/routes/route_name.dart';
import 'package:bank_sha/routes/route_pages.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: PagesName.homePage,
      routes: AppPages.pages,
    );
  }
}
