import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:whatsapp_helper/about_devloper.dart';
import 'package:whatsapp_helper/homescreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new WhatsappHelper());
  });
}

class WhatsappHelper extends StatelessWidget {
  const WhatsappHelper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
        primaryTextTheme: TextTheme(
          subtitle1: TextStyle(color: Colors.blueGrey),
        ),
      ),
      themeMode: ThemeMode.dark,
      home: Homescreen(),
      routes: {
        Homescreen.id: (context) => Homescreen(),
        About.id: (context) => About(),
      },
    );
  }
}
