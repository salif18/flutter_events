import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';

class GetPositionWidget extends StatefulWidget {
  const GetPositionWidget({Key? key}) : super(key: key);

  @override
  State<GetPositionWidget> createState() => _GetPositionWidgetState();
}

class _GetPositionWidgetState extends State<GetPositionWidget> {
  late double _latitude;
  late double _longitude;

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
      double latitude = position.latitude;
      double longitude = position.longitude;

      // Utiliser les valeurs de latitude et longitude selon vos besoins
      setState(() {
        _latitude = latitude;
        _longitude = longitude;
        print(_latitude);
        print(_longitude);
      });
    } catch (e) {
      // Gérer les erreurs
      print("Erreur lors de la récupération de la position : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => getPosition(context),
      child: Text("Demander la position"),
    );
  }
}
