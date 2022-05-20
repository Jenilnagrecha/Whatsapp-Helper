import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  About({Key? key}) : super(key: key);
  static String id = 'about';
  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: SizedBox()),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  'Hello folks hope my app would be reducing your tedious task of saving contact while texting for single time.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  'For suggestion and conversation hit me up at:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(child: SizedBox()),
                GestureDetector(
                  onTap: () => _sendontweet(),
                  child: CircleAvatar(
                    maxRadius: 30,
                    backgroundImage: AssetImage('assets/twitter.png'),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () => _sendMail(),
                  child: CircleAvatar(
                    maxRadius: 30,
                    backgroundImage: AssetImage('assets/mail.png'),
                  ),
                ),
                Expanded(child: SizedBox()),
              ],
            ),
            Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}

_sendMail() async {
  // Android and iOS
  const uri = 'mailto:nagrechajenil@gmail.com';
  if (await canLaunchUrl(Uri.parse(uri))) {
    await launchUrl(Uri.parse(uri));
  } else {
    throw 'Could not launch $uri';
  }
}

_sendontweet() async {
  // Android and iOS
  const uri = 'https://twitter.com/nagrecha_jenil';
  if (await canLaunchUrl(Uri.parse(uri))) {
    await launchUrl(Uri.parse(uri));
  } else {
    throw 'Could not launch $uri';
  }
}
