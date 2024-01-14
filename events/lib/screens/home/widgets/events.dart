import 'package:events/models/eventsdata.dart';
import 'package:events/screens/details/description.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyEvents extends StatelessWidget {
  MyEvents({super.key});

  final List <Evenements> eventData = Evenements.getEvents();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding:const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         children: [
          Text("Evenements à venir", style: GoogleFonts.roboto(fontSize:23,fontWeight: FontWeight.w600, color:const Color(0xFFFFC200)),),
          const SizedBox(height: 20),
          Column(
          children : eventData.map((event){
              return GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,MaterialPageRoute(
                    builder: (context) => EventDescription(event:event)
                    ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 150, 
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), 
                      color:const Color(0xFF123945)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [ 
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [ 
                            Padding(
                              padding:const EdgeInsets.all(15),
                              child: Text(event.eventName, 
                                style: GoogleFonts.roboto(
                                  fontSize: 20, 
                                  color:const Color(0xFFFFC200))),
                              ),
                              Padding(
                              padding:const EdgeInsets.symmetric(horizontal:15,),
                              child: Row(
                                children: [
                                  const Icon(Icons.calendar_month, size:28, color:Colors.white),
                                   const SizedBox(width: 5),
                                  Text(event.eventDate, 
                                    style: GoogleFonts.roboto(
                                      fontSize: 18, 
                                      color:Colors.white)),
                                ],
                              ),
                              ), 
                              const SizedBox(height: 10),
                              Padding(
                              padding:const EdgeInsets.symmetric(horizontal:15),
                              child: Row(
                                children: [
                                  const Icon(Icons.location_on, size:28, color:Colors.white),
                                  const SizedBox(width: 5),
                                  Text(event.eventMaps, 
                                    style: GoogleFonts.roboto(
                                      fontSize: 15, 
                                      color:Colors.white)),
                                ],
                              ),
                              )

                          ],
                        ), 
                        Container(
                          height: 150, 
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(event.eventImg),
                              fit: BoxFit.cover
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
         }).toList(),
        )]
        ),
      ),
    );
  }
}