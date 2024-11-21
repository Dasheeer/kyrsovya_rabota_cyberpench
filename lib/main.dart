import 'package:firebase_core/firebase_core.dart';
import 'izbrannoe.dart';
import 'forum_spisok.dart';
import 'profile.dart';
import 'package:flutter/material.dart';
import 'yslygi_spisok.dart';
import 'login.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    const MaterialApp(
      home: LoginScreen(),
    ),
  );
}


class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int bottomindex = 0;

  List<Widget> widgetOptions = <Widget>[
    const ForumList(),
    const ServiceList(),
    const FavoriteUser(),
    const Profile(),

  ];

  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  get child => null;
  late final int id;

  void onItemTap(int index) {
    setState(() {
      bottomindex = index;
    });
  }

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:
        Center(child: widgetOptions.elementAt(bottomindex)),
        bottomNavigationBar:
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              const BoxShadow(color: Colors.white, spreadRadius: 2),
            ],
          ),

          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(1.0),
              topRight: Radius.circular(1.0),

            ),


            child: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              unselectedItemColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 11, 58, 71),
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(

                    icon:
                    Icon(
                      Icons.adb,
                      size: 40,
                      color: Colors.white,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.menu,
                      size: 40,
                      color: Colors.white,
                    ),
                    label: ""),BottomNavigationBarItem(
                    icon: Icon(
                      Icons.favorite_border,
                      size: 40,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person_outline,
                      size: 40,
                    ),
                    label: ""),

              ],
              currentIndex: 0,
              onTap: onItemTap,
            ),
          ),
        ),
      ),
    );
  }
}

