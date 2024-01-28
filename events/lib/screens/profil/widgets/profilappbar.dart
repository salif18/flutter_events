import 'package:events/screens/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfilAppBar({super.key});

  @override 
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top:MediaQuery.of(context).padding.top,
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text("Profil",
        style:GoogleFonts.roboto(
          fontSize:25,
          fontWeight: FontWeight.w500, 
          color:Colors.white
        )),
      ),
    );
  }
}