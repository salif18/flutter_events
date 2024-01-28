import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';

class MySettings extends StatefulWidget {
  const MySettings({super.key});

  @override
  State<MySettings> createState() => _MySettingsState();
}

class _MySettingsState extends State<MySettings> {
  void getPosition(BuildContext context) async {
   
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
      final double latitude = position.latitude;
      final double longitude = position.longitude;
      print("Localisation actives coordonnees:");
      print(latitude);
      print(longitude);
    } catch (err) {
      // Gérer les erreurs
      print("Erreur lors de la récupération de la position : $err");
    }
  }

  void autoriseNotification(BuildContext context) {
    print("Notification actives");
  }

  bool _autorisedNotification = false;
  bool _activedLocalisation = false;

//autoriser la notification
  void getNotification(value) {
    switch (value) {
      case true:
        autoriseNotification(context);
      default:
        return;
    }
  }

//obtenir la position
  void getLocalication(value) {
    switch (value) {
      case true:
        getPosition(context);
      default:
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Row(
                  children: [
                    const Icon(
                      Icons.notifications_none,
                      size: 30,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Notifications",
                      style: GoogleFonts.aBeeZee(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Switch(
                        value: _autorisedNotification,
                        onChanged: (value) {
                          setState(() {
                            _autorisedNotification = value;
                            getNotification(value);
                          });
                        },
                        activeColor: const Color.fromARGB(255, 11, 34, 41),
                        inactiveThumbColor:
                            const Color.fromARGB(255, 11, 34, 41),
                        activeTrackColor:
                            const Color.fromARGB(255, 197, 149, 6),
                        inactiveTrackColor:
                            const Color(0xFF123945)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_searching_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Localisation",
                      style: GoogleFonts.aBeeZee(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      width: 35,
                    ),
                    Switch(
                        value: _activedLocalisation,
                        onChanged: (value) {
                          setState(() {
                            _activedLocalisation = value;
                            getLocalication(value);
                          });
                        },
                        activeColor: const Color.fromARGB(255, 11, 34, 41),
                        inactiveThumbColor:
                            const Color.fromARGB(255, 11, 34, 41),
                        activeTrackColor:
                            const Color.fromARGB(255, 197, 149, 6),
                        inactiveTrackColor:
                            const Color(0xFF123945)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: Row(
                  children: [
                    const Icon(
                      Icons.person_remove_alt_1_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Supprimer compte",
                      style: GoogleFonts.aBeeZee(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF123945),
                          minimumSize: const Size(200, 50)),
                      onPressed: () {},
                      child: Text(
                        "Deconnecter",
                        style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[200]),
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
