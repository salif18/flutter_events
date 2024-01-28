import 'package:events/screens/profil/widgets/profilappbar.dart';
import 'package:events/screens/profil/widgets/profilform.dart';
import 'package:events/screens/profil/widgets/profilimage.dart';
import 'package:events/screens/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfilAppBar(),
      body: CustomScrollView(slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              const MyProfilImage(),
            ],
          ),
        ),
        SliverFillRemaining(
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration:const BoxDecoration(
                    //  color: Color(0xFF123945),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      color: const Color(0xFF123945),
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(width: 1, color:Color(0xFF123945)),
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(20),
                            right: Radius.circular(20)),
                      ),
                      child: TabBar(
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black,
                          ),
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelColor: Colors.amber,
                          unselectedLabelColor: Colors.grey[300],
                          tabs: [
                            Tab(
                                child: Row(
                              children: [
                                const Icon(Icons.edit_square, size: 24),
                                const SizedBox(width: 10),
                                Text("Modifier profil",
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600)),
                              ],
                            )),
                            Tab(
                                child: Row(
                              children: [
                                const Icon(Icons.settings_outlined, size: 24),
                                const SizedBox(width: 10),
                                Text("Réglages",
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ))
                          ]),
                    ),
                  ),
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                       ProfilForm(), 
                       MySettings(),
                      ],
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
