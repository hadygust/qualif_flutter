import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:qualif_flutter/app.dart';
import 'package:qualif_flutter/detail.dart';
import 'package:qualif_flutter/login.dart';
import 'package:qualif_flutter/model/comment.dart';
import 'package:qualif_flutter/model/people.dart';
import 'package:qualif_flutter/provider/theme_provider.dart';

void main(List<String> args) {
  runApp(ChangeNotifierProvider(
    child: Tinder(),
    create: (context) => ThemeProvider(isDark: false),
  ));
}

class Tinder extends StatelessWidget {
  Tinder({super.key});

  List<People> people = [
    People(
        name: "Budiman Oey",
        description: "Om om cabul",
        image: "./assets/1.png"),
    People(
        name: "Budiman Kung",
        description: "Om om mesum",
        image: "./assets/2.png"),
    People(
        name: "Budiman Chong",
        description: "Om om pk",
        image: "./assets/3.png"),
    People(
        name: "Budiman Oen",
        description: "Om om pedo",
        image: "./assets/4.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return MaterialApp(
        theme: themeProvider.getTheme,
        title: "Tinder",
        // home: Application(username: "aHa"),
        home: LoginPage(tinder: this),
      );
    });
  }
}
