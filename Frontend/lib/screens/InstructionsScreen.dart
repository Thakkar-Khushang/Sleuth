import 'package:flutter/material.dart';
import 'package:sleuth/components/sleuth_text.dart';

class InstructionsScreen extends StatefulWidget {
  const InstructionsScreen({Key? key}) : super(key: key);

  @override
  State<InstructionsScreen> createState() => _InstructionsScreenState();
}

class _InstructionsScreenState extends State<InstructionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: 
        const [
          BottomNavigationBarItem(
            icon: Icon(Icons.gps_fixed),
            label: "Location",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Scan",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: "SOS",
          ),
        ],),
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 85,
        child: FloatingActionButton(
            isExtended: true,
            backgroundColor: Colors.lightBlueAccent[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            onPressed: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.document_scanner_outlined,
                  color: Colors.black87,
                  size: 33,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text(
                    "Scan",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
