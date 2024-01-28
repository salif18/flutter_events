import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NotificationAppBar({super.key});

  @override 
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top:MediaQuery.of(context).padding.top,
      ),
      child: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text("Notifications",
        style:GoogleFonts.roboto(
          fontSize:20,
          fontWeight: FontWeight.w500, 
          color:Colors.white
        )),
        leading: IconButton(
          onPressed: () => Navigator.pop(context), 
          icon: const Icon(
            Icons.arrow_back_ios_outlined, 
            size:25, 
            color:Colors.white)),
      ),
    );
  }
}