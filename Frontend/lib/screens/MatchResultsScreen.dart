import 'dart:io';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sleuth/screens/InstructionsScreen.dart';

class MatchResultsScreen extends StatefulWidget {
  const MatchResultsScreen({Key? key}) : super(key: key);

  @override
  State<MatchResultsScreen> createState() => _MatchResultsScreenState();
}

class _MatchResultsScreenState extends State<MatchResultsScreen> {
  bool success = false;
  Color? color;
  List<Widget> crimes = [];
  @override
  void initState() {
    super.initState();
    success = true;
    if (success) {
      var danger = 75;
      if (danger <= 25) {
        color = Colors.yellow;
      } else if (danger <= 50) {
        color = Colors.orange;
      } else if (danger <= 75) {
        color = Colors.orange[900];
      } else {
        color = Colors.red[700];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: success
          ? null
          : SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 85,
              child: FloatingActionButton(
                  isExtended: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.lightBlueAccent[200],
                  onPressed: () async {
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InstructionsScreen(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Text(
                      "Try Again",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
          backgroundColor: Colors.grey[800],
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: !success
          ? const FailedMatchScreen()
          : Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[800],
              child: ListView(
                children: <Widget>[
                  const Center(
                    child: Text(
                      "Match Found",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 39.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.40,
                      child:
                          ListView(scrollDirection: Axis.horizontal, children: [
                        Center(
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Our Match",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: CircularPercentIndicator(
                                      radius:
                                          MediaQuery.of(context).size.width *
                                              0.3,
                                      lineWidth: 15,
                                      backgroundColor: Colors.grey[800]!,
                                      progressColor: color,
                                      percent: 75 / 100,
                                      center: CircleAvatar(
                                        radius:
                                            MediaQuery.of(context).size.width *
                                                0.265,
                                        backgroundImage: const AssetImage(
                                            "assets/myPhoto.jpg"),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                        Center(
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Uploaded Picture",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: CircularPercentIndicator(
                                      radius:
                                          MediaQuery.of(context).size.width *
                                              0.3,
                                      lineWidth: 15,
                                      percent: 75 / 100,
                                      backgroundColor: Colors.grey[800]!,
                                      progressColor: color,
                                      center: CircleAvatar(
                                        radius:
                                            MediaQuery.of(context).size.width *
                                                0.265,
                                        backgroundImage: const AssetImage(
                                            "assets/myPhoto.jpg"),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ]),
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Text("Swipe to compare",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                  ),
                  Center(
                      child: Text("Danger Level: 75%",
                          style: TextStyle(
                              color: color,
                              fontSize: 20,
                              fontWeight: FontWeight.w500))),
                ],
              )),
    );
  }
}

class FailedMatchScreen extends StatelessWidget {
  const FailedMatchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.grey[800],
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.075),
              child: Image.asset("assets/try.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: const Text("No Match Found",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w500)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: const Text(
                  "Try rescanning or uploading a better or different picture of the suspect.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
            )
          ],
        ));
  }
}
