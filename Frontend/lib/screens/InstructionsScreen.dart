import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sleuth/components/sleuth_text.dart';
import 'package:sleuth/screens/PictureConfirmationScreen.dart';

class InstructionsScreen extends StatefulWidget {
  const InstructionsScreen({Key? key}) : super(key: key);

  @override
  State<InstructionsScreen> createState() => _InstructionsScreenState();
}

class _InstructionsScreenState extends State<InstructionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
          height: 80,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.lightBlueAccent[200],
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.black,
              onTap: (value) {
                if (value == 0) {
                  // Navigator.pushNamed(context, "/location");
                } else if (value == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PictureConfirmationScreen(),
                    ),
                  );
                } else if (value == 2) {
                  // Navigator.pushNamed(context, "/sos");
                }
              },
              items: [
                const BottomNavigationBarItem(
                  icon: Icon(Icons.gps_fixed),
                  label: "Location",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/scan.svg",
                    width: 25,
                  ),
                  label: "Scan",
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.call),
                  label: "SOS",
                ),
              ],
            ),
          )),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.grey[900],
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.175),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SleuthText(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Your safety is our priority",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 68.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: const Text(
                    "Tap on the scan button below to take or upload a picture of the suspect",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Image.asset(
                "assets/dog.png",
                width: MediaQuery.of(context).size.width * 0.8,
                height: 200,
              )
            ],
          ),
        ),
      ),
    );
  }
}
