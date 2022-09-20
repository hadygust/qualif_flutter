import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qualif_flutter/model/content.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  var content = [
    Content(image: "/home/head.jpg", text: "Meet new people"),
    Content(image: "/home/head.jpg", text: "Spice up your game"),
    Content(image: "/home/head.jpg", text: "Be bold"),
    Content(image: "/home/head.jpg", text: "Bro u down bad"),
    Content(image: "/home/head.jpg", text: "Tolong jangan asal swipe"),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: [
            Stack(
              children: <Widget>[
                SizedBox(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset("./assets/head.jpg"),
                  ),
                ),
                Container(
                  height: 260,
                  padding: EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    "Welcome To Tinder",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(4, 20, 0, 10),
              child: Text(
                "Match. Chat. Meet. Tinder®.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                "Go beyond your social circle and connect with people near and far. You’re about to have the best online dating experience — all you need are some good pics and a solid bio to stand out.",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            CarouselSlider(
              items: content
                  .map(
                    (e) => Container(
                      margin: const EdgeInsets.fromLTRB(12, 24, 12, 0),
                      child: Stack(
                        children: <Widget>[
                          SizedBox(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(e.image),
                            ),
                          ),
                          Container(
                            height: 200,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 22, vertical: 12),
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              e.text,
                              style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                  // height: 400,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  autoPlayAnimationDuration: const Duration(seconds: 1)),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(4, 20, 0, 10),
              child: Text(
                "See What Happens When You Swipe Right®",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                "Swipe Right® to Like someone or Swipe Left™ to say Nope. We’ll only let them know you’re interested Mantap geming men when the feeling is mutual.",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                textAlign: TextAlign.start,
              ),
            ),
          ])),
    );
  }
}
