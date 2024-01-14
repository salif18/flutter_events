import 'package:events/routes/routes.dart';
import 'package:flutter/material.dart';
//123945

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Events",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF00232F),
      ),
      routes: {
        "/":(context) => const Routes(),
      },
    );
  }
}