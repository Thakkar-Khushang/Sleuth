import 'package:flutter/material.dart';

class SleuthText extends StatelessWidget {
  const SleuthText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('sleuth',
        style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ));
  }
}
