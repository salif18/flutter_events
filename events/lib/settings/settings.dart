import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MySettings extends StatefulWidget {
  const MySettings({super.key});

  @override
  State<MySettings> createState() => _MySettingsState();
}

class _MySettingsState extends State<MySettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Réglages",
        style: GoogleFonts.aBeeZee(
          fontSize: 25, 
          fontWeight: FontWeight.w600, 
          color:Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [ 
            Container(),
          ],
        ),
      ),
    );
  }
}