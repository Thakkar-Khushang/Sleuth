import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneNumberDialog extends StatefulWidget {
  const PhoneNumberDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<PhoneNumberDialog> createState() => _PhoneNumberDialogState();
}

class _PhoneNumberDialogState extends State<PhoneNumberDialog> {
  final _formkey = GlobalKey<FormState>();
  String phNumber = "";
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      titlePadding: const EdgeInsets.only(top: 33, left: 30, right: 30),
      contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      actionsPadding: const EdgeInsets.only(bottom: 33, left: 30, right: 30),
      backgroundColor: Colors.grey[900],
      actionsAlignment: MainAxisAlignment.center,
      title: const Text("Set your emergency contact",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
      content: Form(
        key: _formkey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                "Please fill in your emergency contact number to help us protect you in case of an emergency.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400)),
            const SizedBox(
              height: 20,
            ),
            InternationalPhoneNumberInput(
              selectorConfig: const SelectorConfig(
                  showFlags: false,
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  leadingPadding: 0,
                  setSelectorButtonAsPrefixIcon: true,
                  trailingSpace: false),
              textStyle: const TextStyle(color: Colors.white),
              inputDecoration: const InputDecoration(
                hintText: "Enter your phone number",
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              searchBoxDecoration: const InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.black),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              selectorTextStyle: const TextStyle(color: Colors.white),
              onInputChanged: (PhoneNumber number) {
                setState(() {
                  phNumber = number.phoneNumber!;
                });
                print(phNumber);
              },
              countries: const ['IN', 'US'],
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent[100],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () async {
                  if (_formkey.currentState!.validate()) {
                    const secureStorage = FlutterSecureStorage();
                    await secureStorage.write(
                        key: "phone_number", value: phNumber);
                    Navigator.pop(context);
                  }
                },
                child: const Text('Submit',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500)),
              ),
            ),
          ],
        )
      ],
    );
  }
}
