import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeUser extends StatelessWidget {
  const WelcomeUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ 
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text("Salut, Salif !",
                    style:GoogleFonts.roboto(
                      fontSize:24, 
                      color:Colors.white, 
                      fontWeight: FontWeight.w500),
                  ),
                ), 
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text("Explore ce qui se pointe à proximité", 
                   style:GoogleFonts.roboto(
                     fontSize:19, 
                     color:const Color.fromARGB(255, 219, 217, 217), 
                     fontWeight: FontWeight.w400),
                    ),
                ),
              ],
            ),
            CircleAvatar(
              radius: 20,
              child: Image.asset(
                "assets/avatars/profil.jpg", 
                 width: 50, 
                 height: 50,
                ),
            ),
          ],
        )
      ),
    );
  }
}