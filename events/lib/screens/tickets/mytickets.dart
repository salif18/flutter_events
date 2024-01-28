import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTickets extends StatefulWidget {
  const MyTickets({super.key});

  @override
  State<MyTickets> createState() => _MyTicketsState();
}

class _MyTicketsState extends State<MyTickets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0, 
        backgroundColor: Colors.transparent,
        title: Text("Mes tickets",
        style:GoogleFonts.aBeeZee(
          fontSize: 25, 
          fontWeight: FontWeight.w600, 
          color:Colors.white)),
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