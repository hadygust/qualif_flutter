import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qualif_flutter/detail.dart';
import 'package:qualif_flutter/model/people.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BrowsePage extends StatelessWidget {
  final String username;
  BrowsePage({super.key, required this.username});

  var people = [
    People(
        name: "Budiman Oey",
        description: "Om om cabul",
        image: "/people/1.png"),
    People(
        name: "Budiman Oey",
        description: "Om om cabul",
        image: "/people/2.png"),
    People(
        name: "Budiman Oey",
        description: "Om om cabul",
        image: "/people/3.png"),
    People(
        name: "Budiman Oey",
        description: "Om om cabul",
        image: "/people/4.png"),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size * 0.75;
    // return Container(
    return SizedBox(
      height: size.height,
      child: CarouselSlider(
        items: people
            .map(
              (e) => GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailPage(people: e, username: username,);
                  },));
                },
                child: Card(
                  
                  margin: const EdgeInsets.fromLTRB(12, 24, 12, 0),
                  // child: Stack(
                  //   children: <Widget>[
                  //     SizedBox(
                  //       child: ClipRRect(
                  //         borderRadius: BorderRadius.circular(10),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.stretch,
                  //           children: [
                  //             Image.asset(e.image, fit: BoxFit.fill,),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //     Container(
                  //       height: 800,
                  //       padding: const EdgeInsets.symmetric(
                  //           horizontal: 22, vertical: 12),
                  //       alignment: Alignment.bottomLeft,
                  //       child: Text(
                  //         e.name,
                  //         style: const TextStyle(
                  //             fontSize: 24,
                  //             fontWeight: FontWeight.bold,
                  //             color: Colors.white),
                  //       ),
                  //     )
                  //   ],
                  // ),
                  semanticContainer: true,
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 320,
                            width: size.width * 0.8,
                            // child: SingleChildScrollView(
                                child: Image.asset(
                              e.image,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            width: size.width * 0.8,
                            height: 76,
                            color: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(e.name,
                                textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(e.description,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
        options: CarouselOptions(
            height: 420,
            autoPlay: false,
            autoPlayAnimationDuration: const Duration(seconds: 1)),
      ),
    );
    // );
  }
}
