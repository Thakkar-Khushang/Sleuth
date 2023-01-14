import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sleuth/components/phone_number_dialog.dart';
import 'package:sleuth/components/sleuth_text.dart';
import 'package:sleuth/screens/InstructionsScreen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.grey[900],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/logo.png',
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 20),
              const SleuthText(),
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: TextButton(
                  onPressed: () async {
                    const storage = FlutterSecureStorage();
                    String? value = await storage.read(key: "phone_number");
                    if (value == null) {
                      showDialog(
                        context: context,
                        builder: (context) => const PhoneNumberDialog(),
                      );
                    } else {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InstructionsScreen(),
                        ),
                      );
                    }
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10)),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.lightBlueAccent[100]),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
