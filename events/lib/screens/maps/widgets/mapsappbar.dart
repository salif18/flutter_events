import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MapsAppBAr extends StatelessWidget implements PreferredSizeWidget {
  const MapsAppBAr({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new,
                size: 25, color: Colors.white)),
        backgroundColor: Colors.transparent,
        title: Text(
          "Le lieu",
          style: GoogleFonts.aBeeZee(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
    );
  }
}
