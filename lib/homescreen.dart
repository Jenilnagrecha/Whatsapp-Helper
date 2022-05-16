import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';

class Homescreen extends StatefulWidget {
  Homescreen({Key? key}) : super(key: key);
  static String id = 'homescreen';

  @override
  State<Homescreen> createState() => _HomescreenState();
}

const int maxattempts = 3;

class _HomescreenState extends State<Homescreen> {
  String phonenum = " ";
  TextEditingController myController = TextEditingController();
  TextEditingController codecont = TextEditingController();
  late BannerAd staticAd;
  late Banner inlineAd;
  bool staticAdloaded = false;
  bool inlineAdloaded = false;
  static const AdRequest adrequest = AdRequest();
  void loadbannerAd() {
    staticAd = BannerAd(
      adUnitId: "ca-app-pub-7456861643470662/5726175606",
      size: AdSize.banner,
      request: adrequest,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            staticAdloaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print("Adfailed to load ${error.message}");
        },
      ),
    );
    staticAd.load();
  }

  @override
  void initState() {
    loadbannerAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              if (staticAdloaded)
                Container(
                  child: AdWidget(
                    ad: staticAd,
                  ),
                  width: staticAd.size.width.toDouble(),
                  height: staticAd.size.height.toDouble(),
                  alignment: Alignment.center,
                ),
              Expanded(child: SizedBox()),
              Text('Enter phone number',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.07,
                      fontFamily: 'RaleWay',
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 75,
                      child: Flexible(
                        child: TextField(
                          controller: codecont,
                          style: TextStyle(color: Colors.white, fontSize: 25),
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: 'code',
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 15),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.white),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.white),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                width: 2,
                              ),
                            ),
                            hintMaxLines: 1,
                            hintText: '+91',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    SizedBox(
                      width: width * 0.7,
                      child: Flexible(
                        child: TextField(
                          controller: myController,
                          style: TextStyle(color: Colors.white, fontSize: 25),
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: 'Phone no.',
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 15),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.white),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.white),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                width: 2,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.phone_android_outlined,
                              color: Colors.white,
                            ),
                            hintMaxLines: 1,
                            hintText: '0123456789',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              ),
              GestureDetector(
                onTap: () async {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  phonenum = await myController.text;
                  String code = await codecont.text;
                  openwhatsapp(phonenum, code);
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 2,
                        spreadRadius: 2,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  height: 50,
                  width: 100,
                  child: Center(
                    child: Text(
                      'Go',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }

  openwhatsapp(String phone, String code) async {
    var whatsapp = "$code" + "$phone";
    var whatsappURl_android =
        "whatsapp://send?phone=" + whatsapp + "&text=hello";
    var whatappURL_ios = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrl(Uri.parse(whatappURL_ios))) {
        await launchUrl(
          Uri.parse(whatappURL_ios),
        );
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
      }
    } else {
      // android , web
      if (await canLaunchUrl(Uri.parse(whatsappURl_android))) {
        await launchUrl(Uri.parse(whatsappURl_android));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
      }
    }
  }
}
