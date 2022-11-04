// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:varchas_app/Utils/constants.dart';
import '../widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

var base_url = "varchas22.in"; //"172.31.50.153:8000";

class ChooseSportScreen extends StatefulWidget {
  const ChooseSportScreen({Key? key}) : super(key: key);

  @override
  _ChooseSportScreenState createState() => _ChooseSportScreenState();
}

class _ChooseSportScreenState extends State<ChooseSportScreen> {
  @override
  Widget build(BuildContext context) {
    Size data = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: data.height * 0.05,
        backgroundColor: Colors.black87, //.fromARGB(255,18,7,17),
      ),
      drawer: NavigationDrawer('l'),
      backgroundColor: Color.fromRGBO(35, 14, 33, 25),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Header(size: data, screenName: "Score Card"),
            SizedBox(
              height: data.height * 0.01,
            ),
            GestureDetector(
              onTap: () {
                openSheet('Overall');
              },
              child: Card(
                color: Colors.black,
                margin: EdgeInsets.all(6),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      //image,
                      SvgPicture.asset(
                        "assets/overall.svg",
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.8,
                      ),
                      const Text(
                        "OVERALL",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Scrollbar(
                thickness: 4,
                thumbVisibility: false,
                child: ListView(
                  //padding: const EdgeInsets.all(1.5),
                  children: <Widget>[
                    GridView.count(
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      childAspectRatio: 45 / 60,
                      crossAxisCount: 2,
                      children: List.generate(sportsList.length, (index) {
                        return displaySportIcon(sportsList[index]);
                      }),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget displaySportIcon(String sportName) {
    return GestureDetector(
      onTap: () {
        openSheet(sportName);
      },
      child: Card(
        color: Colors.black,
        margin: EdgeInsets.all(6),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              StreamBuilder<Object>(
                  stream: null,
                  builder: (context, snapshot) {
                    String imgUrl =
                        "http://$base_url/static/images/${sportName.toLowerCase()}.png";
                    if (sportUrlExceptions.keys.contains(sportName)) {
                      imgUrl =
                          "http://$base_url/static/images/${sportUrlExceptions[sportName].toString()}.png";
                    }
                    return Image.network(
                      imgUrl,
                      height: MediaQuery.of(context).size.width * 0.4,
                      width: MediaQuery.of(context).size.width * 0.4,
                    );
                  }),
              Text(
                sportName.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

openSheet(sportName) async {
  var response = await http.get(Uri.parse("http://$base_url/app_apis/score/"),
      headers: {"name": sportName});
  String link = json.decode(response.body)['link'];

  Uri _url = Uri.parse(link);
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}
