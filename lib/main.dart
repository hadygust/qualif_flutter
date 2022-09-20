import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:qualif_flutter/app.dart';
import 'package:qualif_flutter/detail.dart';
import 'package:qualif_flutter/login.dart';
import 'package:qualif_flutter/provider/theme_provider.dart';

void main(List<String> args) {
  runApp(ChangeNotifierProvider(
    child: const Tinder(),
    create: (context) => ThemeProvider(isDark: false),
  ));
}

class Tinder extends StatelessWidget {
  const Tinder({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return MaterialApp(
        theme: themeProvider.getTheme,
        title: "Tinder",
        home: Application(username: "aHa"),
      );
    });
  }
}
