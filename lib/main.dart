import 'package:flutter/material.dart';
import 'package:whatsapp_helper/homescreen.dart';

void main() {
  runApp(const WhatsappHelper());
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
      },
    );
  }
}