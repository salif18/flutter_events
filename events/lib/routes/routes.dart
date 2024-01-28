import 'package:events/screens/home/homescreen.dart';
import 'package:events/screens/profil/profil.dart';
import 'package:events/screens/settings/settings.dart';
import 'package:events/screens/tickets/mytickets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';


class Routes extends StatefulWidget {
  const Routes({Key? key}) : super(key: key);
  

  @override
  State<Routes> createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  int _index =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:const [
        HomeScreen(), 
        MyTickets(), 
        ProfilScreen()
      ][_index],
      bottomNavigationBar: GNav(
        mainAxisAlignment: MainAxisAlignment.center,
        selectedIndex: _index,
        onTabChange:(index) => setState(()=> _index = index),
        backgroundColor: const Color(0xFF123945),
        padding: const EdgeInsets.all(15),
        tabBackgroundColor: const Color.fromARGB(255, 4, 13, 15),
        activeColor: const Color(0xFFFFC200),
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        tabMargin:const EdgeInsets.all(15),
        gap: 10,
        textStyle: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w500, color:Colors.amber),
        tabs: const [
          GButton(
            icon: Icons.home_rounded, 
            iconColor: Colors.white,
            iconSize: 28,
            text: "Events",
          ),
           GButton(
            icon: LineIcons.alternateTicket, 
            iconColor: Colors.white,
            iconSize: 28,
            text: "Mes tickets",           
          ),
           GButton(
            icon: Icons.person_outline_outlined,
            iconColor: Colors.white,
            iconSize: 28,
            text: "Profil",
          ),
        ]
        ),
    );
  }
}
