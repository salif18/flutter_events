import 'package:events/screens/home/widgets/carousel.dart';
import 'package:events/screens/home/widgets/categorie_option.dart';
import 'package:events/screens/home/widgets/events.dart';
import 'package:events/screens/home/widgets/welcom_user.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late double _latitude;
  late double _longitude;

  void getPositionAndShared(BuildContext context) async {
    try {
      // Demander l'accès à la position locale
      LocationPermission permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        // L'utilisateur a refusé l'accès à la position
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "L'accès à la position est refusé.",
              style: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
        return;
      }

      // Récupérer la position locale
      Position position = await Geolocator.getCurrentPosition();

      // Récupérer la latitude et la longitude
      double latitude = position.latitude;
      double longitude = position.longitude;

      // Utiliser les valeurs de latitude et longitude selon vos besoins
      setState(() {
        _latitude = latitude;
        _longitude = longitude;
      });

       final shareUrl = 'https://www.google.com/maps?q=$latitude,$longitude';

    // Ouvrir dans une nouvelle fenêtre en utilisant url_launcher
    if (await canLaunch(shareUrl)) {
      await launch(shareUrl);
    } else {
      // Gérer l'erreur
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Impossible d 'ouvrir Google Maps.", 
           style: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),),
        ),
      );
    }
    } catch (e) {
      // Gérer les erreurs
      print("Erreur lors de la récupération de la position : $e");
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        body: SingleChildScrollView(
          child: Column(
            children: [
               AppBar(
          toolbarHeight: 80,
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: IconButton(
                onPressed: () {},
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
          onPressed: () => getPositionAndShared(context),
          child: const Icon(Icons.search, size: 30, color: Colors.white),
        ),
      ),
    );
  }
}
