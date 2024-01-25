import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SharedMapUser extends StatelessWidget {
  const SharedMapUser({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => shareLocation(context),
      child: Row(
        children: [
          Image.network(
            "https://www.theadx.com/images-en/img-lokasyon-hedefleme.png",
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 8),
          Text("Afficher ma localisation"),
        ],
      ),
    );
  }

  void shareLocation(BuildContext context) async {
    // Demander la position actuelle de l'utilisateur
    // Utilisez les fonctionnalités de géolocalisation de Flutter ici
    // ...

    // Partager la position via Google Maps
    final latitude = 37.7749; // Remplacez par la latitude réelle
    final longitude = -122.4194; // Remplacez par la longitude réelle
    final shareUrl = 'https://www.google.com/maps?q=$latitude,$longitude';

    // Ouvrir dans une nouvelle fenêtre en utilisant url_launcher
    if (await canLaunch(shareUrl)) {
      await launch(shareUrl);
    } else {
      // Gérer l'erreur
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Impossible d\'ouvrir Google Maps.'),
        ),
      );
    }
  }
}
