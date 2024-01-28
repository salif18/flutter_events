import 'package:events/screens/home/widgets/carousel.dart';
import 'package:events/screens/home/widgets/categorie_option.dart';
import 'package:events/screens/home/widgets/events.dart';
import 'package:events/screens/home/widgets/welcom_user.dart';
import 'package:events/screens/notification/notifications.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                ),
                child: AppBar(
                  title: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Bama",
                            style: GoogleFonts.abel(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFFFC200),
                            ),
                          ),
                          TextSpan(
                            text: " - EVE",
                            style: GoogleFonts.abel(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: "NTS",
                            style: GoogleFonts.abel(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFFFC200),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, 
                          vertical: 20
                      ),
                      child: IconButton(
                        onPressed:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const NotificationsScreen()));
                        },
                        icon: const Icon(
                          Icons
                              .notifications, // Correction ici, utiliser LineIcons au lieu de LineIcon
                          size: 28,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                ),
              ),
              const WelcomeUser(),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Les plus proches",
                      style: GoogleFonts.roboto(
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFFFC200),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 5),
              AfficheWidget(),
              const SizedBox(height: 25),
              const CategorieSelected(),
              MyEvents()
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFFFFC200),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const NotificationsScreen()));
          },
          child: const Icon(Icons.search, size: 30, color: Colors.white),
        ),
      ),
    );
  }
}
