import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategorieSelected extends StatefulWidget {
  const CategorieSelected({super.key});

  @override
  State<CategorieSelected> createState() => _CategorieSelectedState();
}

class _CategorieSelectedState extends State<CategorieSelected> {
  final List<dynamic> catego = [
    {"name": "Concert", "iconImg": "assets/icons/mic.png"},
    {"name": "Festival", "iconImg": "assets/icons/sport.png"},
    {"name": "Humour", "iconImg": "assets/icons/hum.png"},
    {"name": "Public Show", "iconImg": "assets/icons/show.png"},
    {"name": "Sport", "iconImg": "assets/icons/sport.png"},
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Categories",
              style: GoogleFonts.roboto(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFFFC200)),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 90,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: catego.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(width: 10),
                itemBuilder: (BuildContext context, int index) {
                  final item = catego[index];
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      width: 150,
                      height: 100,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFF123945)),
                      child: Column(
                        children: [
            
                          Image.asset(
                            item["iconImg"],
                            width: 50,
                            height: 50,
                            color: Colors.white,
                          ),
                          Text(item['name'],
                              style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color:Colors.white)),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
