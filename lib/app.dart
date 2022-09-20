import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:qualif_flutter/browse.dart';
import 'package:qualif_flutter/home.dart';
import 'package:qualif_flutter/login.dart';
import 'package:qualif_flutter/provider/theme_provider.dart';

int _idx = 1;

class Application extends StatefulWidget {
  final String username;

  Application({super.key, required this.username});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {

  @override
  Widget build(BuildContext context) {
    var pages = [HomePage(), BrowsePage(username: widget.username,)];

    void logout(BuildContext context) {
      print("Logout");
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return const LoginPage();
        },
      ), (route) => false);
    }
    Size size = MediaQuery.of(context).size;
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return Scaffold(
        drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: [
            SizedBox(
              height: 88.0,
              child: DrawerHeader(
                // decoration: BoxDecoration(color: Colors.black),
                child: Text(widget.username,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                // margin: EdgeInsets.all(0.0),
                // padding: EdgeInsets.all(0.0),
              ),
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.5),
                  child: Text(
                    "Change Theme",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Switch(
                  value: themeProvider.isDarkMode,
                  onChanged: (value) {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .swapTheme();
                  },
                )
              ],
            ),
            ListTile(
                title: const Text("Logout"),
                onTap: (() {
                  logout(context);
                })),
          ]),
        ),
        appBar: AppBar(
          title: const Text("Tinder"),
        ),

        //MainPage
        body: pages[_idx],

        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            //ON PRESS HERE
            setState(() {
              _idx = 0;
            });
            print(_idx);
          },
          child: const Icon(
            Icons.home,
            color: Colors.redAccent,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        // bottomNavigationBar: BottomNav(
        //   username: widget.username,
        //   size: size,
        // ),

        bottomNavigationBar: BottomAppBar(
            //bottom navigation bar on scaffold
            color: Colors.redAccent,
            shape: const CircularNotchedRectangle(), //shape of notch
            notchMargin:
                5, //notche margin between floating button and bottom appbar
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Row(
                //children inside bottom appbar
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: size.height * 0.08,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                          child: IconButton(
                            icon: const Icon(
                              Icons.amp_stories,
                              color: Colors.white,
                              semanticLabel: "Browse",
                              textDirection: TextDirection.ltr,
                            ),
                            onPressed: () {
                              setState(() {
                                _idx = 1;
                              });
                              print(_idx);
                            },
                          ),
                        ),
                        const Text(
                          "Browse",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.08,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                          child: IconButton(
                            icon: const Icon(
                              Icons.account_circle,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                _idx = 2;
                              });

                              print(_idx);
                            },
                          ),
                        ),
                        Text(
                          widget.username,
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  // IconButton(
                  //   icon: const Icon(
                  //     Icons.output,
                  //     color: Colors.white,
                  //   ),
                  //   onPressed: () {},
                  // ),
                ],
              ),
            )),
      );
    });
  }
}
