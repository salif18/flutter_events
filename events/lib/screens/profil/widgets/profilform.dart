import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilForm extends StatefulWidget {
  const ProfilForm({super.key});

  @override
  State<ProfilForm> createState() => _ProfilFormState();
}

class _ProfilFormState extends State<ProfilForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: null, 
      onChanged: (){},
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              keyboardType: TextInputType.none,
              decoration: InputDecoration(
                fillColor: const Color(0xFF123945),
                filled: true,
                hintText: "Photo",
                hintStyle: GoogleFonts.roboto(fontSize: 18,color: Colors.white),
                prefixIcon: const Icon(
                  Icons.photo_camera_outlined,
                  color:Colors.white, 
                  size:30), 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20), 
                    borderSide: BorderSide.none
                  )
              ),
            ),
          ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  fillColor: const Color(0xFF123945),
                  filled: true,
                  hintText: "Pseudo",
                  hintStyle: GoogleFonts.roboto(fontSize: 18,color: Colors.white),
                  prefixIcon: const Icon(
                    Icons.person_2_outlined,
                    color:Colors.white, 
                    size:30), 
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20), 
                      borderSide: BorderSide.none
                    )
                ),
              ),
            ), 
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  fillColor: const Color(0xFF123945),
                  filled: true,
                  hintText: "Numero",
                  hintStyle: GoogleFonts.roboto(fontSize: 18,color: Colors.white),
                  prefixIcon: const Icon(
                    Icons.phone_android_rounded,
                    color:Colors.white, 
                    size:30), 
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20), 
                      borderSide: BorderSide.none
                    )
                ),
              ),
            ),
            Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                fillColor: const Color(0xFF123945),
                filled: true,
                hintText: "Email",
                hintStyle: GoogleFonts.roboto(fontSize: 18,color: Colors.white),
                prefixIcon: const Icon(
                  Icons.mail_outline_rounded,
                  color:Colors.white, 
                  size:30), 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20), 
                    borderSide: BorderSide.none
                  )
              ),
            ),
          ), 
          Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: Container(
                padding: const EdgeInsets.only(top:10, left:20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF123945),
                    minimumSize: const Size(200, 50)
                  ),
                  onPressed: (){}, 
                  child: Text("Modifier", style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w500, 
                    color:Colors.grey[200]
                  ),)
                  )
              ),
            ),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}