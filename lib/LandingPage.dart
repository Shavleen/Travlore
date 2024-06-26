import 'package:flutter/material.dart' show Alignment, AppBar, BorderRadius, BottomNavigationBar, BottomNavigationBarItem, BottomNavigationBarType, BoxFit, BuildContext, Center, Colors, Column, Expanded, FontWeight, Icon, Icons, Image, InkWell, InputDecoration, MaterialPageRoute, Navigator, OutlineInputBorder, Radius, Scaffold, Stack, State, StatefulWidget, Text, TextField, TextStyle, Widget;
import 'package:travlore_app/CambodiaIt.dart';
import 'package:travlore_app/PanamaIt.dart';

//import 'package:travlore_app/Join.dart';
import 'package:travlore_app/itinerary.dart';
//import 'package:travlore_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:travlore_app/LandingPage.dart';
import 'package:travlore_app/SplashScreen.dart';
import 'nextPage.dart';
import 'Join.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const Directionality(
      textDirection: TextDirection.ltr, // or TextDirection.rtl, depending on your app's direction
      child: MaterialApp(
        title: 'Travlore',
        home: LandingPage(landingPage: '', title: 'landingPage'),
      ),),);
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key, required this.landingPage, required this.title});

  final String landingPage;
  final String title;

  @override
  State<LandingPage> createState() => _State();
}

class _State extends State<LandingPage> {
  final int _selectedIndex = 0;

  void onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
              const LandingPage(title: 'landingPage', landingPage: '',)
          ),

        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ItineraryScreen()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
              const LandingPage(title: 'landingPage', landingPage: '',)
          ),
        );
        break;
    }
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ItineraryScreen(), // Navigate to ItineraryScreen
                          ),
                        );
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            'assets/fiji.png',
                            height: 150,
                            width: 350,
                            fit: BoxFit.cover,
                          ),
                          const Text(
                            'Fiji',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PanamaScreen(), // Navigate to ItineraryScreen
                          ),
                        );
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            'assets/panama.png',
                            height: 150,
                            width: 350,
                            fit: BoxFit.cover,
                          ),
                          const Text(
                            'Panama',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (
                                context) => const CambodiaScreen(), // Navigate to ItineraryScreen
                          ),
                        );
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            'assets/cambodia.png',
                            height: 150,
                            width: 350,
                            fit: BoxFit.cover,
                          ),
                          const Text(
                            'Cambodia',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}