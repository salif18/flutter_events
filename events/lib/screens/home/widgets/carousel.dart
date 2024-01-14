import 'package:carousel_slider/carousel_slider.dart';
import 'package:events/models/eventsdata.dart';
import 'package:events/screens/details/description.dart';
import 'package:flutter/material.dart';

class AfficheWidget extends StatelessWidget {
   AfficheWidget({super.key});



final List<Evenements>  _carouselData = Evenements.getEvents();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          CarouselSlider(
            items: 
                 _carouselData.take(5).map((event){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>
                      EventDescription(event: event)));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      height: 300, 
                      width: 300,
                      decoration: BoxDecoration(
                        color: const Color(0xFF123945),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Image.asset(event.eventImg),
                    ),
                  );
                 }).toList(),
            options: CarouselOptions(
              height: 350,
              enlargeCenterPage: true, 
              autoPlay: true, 
              autoPlayCurve: Curves.fastOutSlowIn, 
              enableInfiniteScroll: true, 
              autoPlayAnimationDuration: const Duration(milliseconds: 800), 
              viewportFraction: 0.7
            ),
          ),
        ],
      ),
    );
  }
}