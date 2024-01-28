import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

//chez moi
//12.583225516627737,-7.929662549392212
class EventDescription extends StatefulWidget {
  const EventDescription({Key? key, required this.event}) : super(key: key);
  final dynamic event;

  @override
  State<EventDescription> createState() => _EventDescriptionState();
}

class _EventDescriptionState extends State<EventDescription> {
  late dynamic _event;

  @override
  void initState() {
    super.initState();
    _event = widget.event;
  }

//partager la position dans googlemaps
  void shareEventLocation(BuildContext context) async {
    // Partager la position via Google Maps
    final double latitude = _event.lat;
    final double longitude = _event.long;
    final shareUrl = 'https://www.google.com/maps?q=$latitude,$longitude';

    // Ouvrir dans une nouvelle fenêtre en utilisant url_launcher
    if (await canLaunch(shareUrl)) {
      await launch(shareUrl);
    } else {
      // Gérer l'erreur
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Impossible d 'ouvrir Google Maps.",
            style: GoogleFonts.roboto(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 100,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Container(
            height: 50, 
            width: 50,
            decoration: BoxDecoration(
              color:const Color.fromARGB(132, 0, 0, 0),
              borderRadius: BorderRadius.circular(100)
            ),
            child: const Icon(Icons.arrow_back_ios_new,
                color: Colors.white, size: 25),
          ),
        ),
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(_event.eventImg),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _event.eventName,
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          const Icon(Icons.calendar_month_rounded,
                              size: 30, color: Color(0xFFFFC200)),
                          const SizedBox(width: 10),
                          Text(_event.eventDate,
                              style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  color: const Color(0xFFFFC200))),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          const Icon(Icons.access_time,
                              size: 30, color: Colors.white),
                          const SizedBox(width: 10),
                          Text(_event.eventHours,
                              style: GoogleFonts.roboto(
                                  fontSize: 20, color: Colors.white)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: InkWell(
                        onTap: () => shareEventLocation(context),
                        child: Row(
                          children: [
                            const Icon(Icons.location_on,
                                size: 30, color: Colors.white),
                            const SizedBox(width: 10),
                            Text(_event.eventMaps,
                                style: GoogleFonts.roboto(
                                    fontSize: 20, color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 18, 57, 64),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text("A propos",
                                  style: GoogleFonts.aBeeZee(
                                      fontSize: 23,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white)),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(_event.eventDesc,
                                  style: GoogleFonts.aBeeZee(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                      color: const Color.fromARGB(
                                          255, 219, 219, 219))),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 150,
            )
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: 100,
        child: Stack(
          children: [
            Positioned(
              left: 40,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "A partir de ",
                              style: GoogleFonts.roboto(
                                  fontSize: 20, color: Colors.white),
                            ),
                            TextSpan(
                              text: "1000 FCFA",
                              style: GoogleFonts.roboto(
                                  fontSize: 18, color: const Color(0xFFFFC200)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFC200),
                          minimumSize: const Size(90, 50),
                        ),
                        onPressed: () {
                          _reservationBottomSheet(context);
                        },
                        label: Text(
                          "Reserver",
                          style: GoogleFonts.roboto(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        icon: const Icon(
                          Icons.arrow_forward_sharp,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _reservationBottomSheet(BuildContext context) {
    final List<Map<String, dynamic>> types = _event.eventTickets;

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.6,
          decoration: const BoxDecoration(
            color: Color(0xFF00232F),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Acheter un ticket",
                        style: GoogleFonts.aBeeZee(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close_rounded,
                            size: 35, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: types.map((e) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 18, 57, 64),
                        ),
                        height: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _event.eventName,
                                  style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  e['type'],
                                  style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "${e['price']} FCFA",
                                  style: GoogleFonts.roboto(
                                      color: const Color(0xFFFFC200),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                      Icons.remove_circle_outline_sharp,
                                      size: 40,
                                      color: Colors.white),
                                ),
                                Text("1",
                                    style: GoogleFonts.roboto(
                                        fontSize: 24, color: Colors.white)),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.add_circle_sharp,
                                      size: 40, color: Color(0xFFFFC200)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: GoogleFonts.roboto(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "20000 FCFa",
                            style: GoogleFonts.roboto(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFFFC200)),
                          ),
                        ],
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFC200),
                        ),
                        onPressed: () {},
                        icon: const Icon(Icons.monetization_on_outlined,
                            size: 33, color: Color(0xFF123945)),
                        label: Text(
                          "Acheter",
                          style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF123945)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
