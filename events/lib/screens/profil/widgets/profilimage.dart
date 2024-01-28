import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyProfilImage extends StatelessWidget {
  const MyProfilImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          // color: Color(0xFF123945),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(100)),
                child: const CircleAvatar(
                  child: Icon(
                    Icons.person_2_outlined,
                    size: 40,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "Salif Moctar Konate",
                  style: GoogleFonts.roboto(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "salifmoctar@gmail.com",
                  style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 182, 182, 182)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
