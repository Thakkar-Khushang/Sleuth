import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sleuth/components/loader.dart';
import 'package:sleuth/screens/MatchResultsScreen.dart';
import 'package:sleuth/utils/https.utils.dart';

class PictureConfirmationScreen extends StatefulWidget {
  const PictureConfirmationScreen({Key? key, required this.imagePath})
      : super(key: key);
  final String imagePath;

  @override
  State<PictureConfirmationScreen> createState() =>
      _PictureConfirmationScreenState();
}

class _PictureConfirmationScreenState extends State<PictureConfirmationScreen> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: loading
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
                    try {
                      setState(() {
                        loading = true;
                      });
                      File image = File(widget.imagePath);
                      final resp = jsonDecode(await asyncFileUpload(image));
                      if (resp['match'] == true) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MatchResultsScreen(
                                match: resp['match'],
                                image: resp['image'],
                                criminal: resp['criminal'],
                                uploaded: widget.imagePath),
                          ),
                        );
                      } else if (resp['success'] == false) {
                        print(resp['message']);
                      } else if (resp['match'] == false) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MatchResultsScreen(
                              match: false,
                            ),
                          ),
                        );
                      }
                    } catch (e) {
                      print(e);
                    }
                    setState(() {
                      loading = false;
                    });
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const MatchResultsScreen(),
                    //   ),
                    // );
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Text(
                      "Upload",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: loading
          ? null
          : AppBar(
              backgroundColor: Colors.grey[800],
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              )),
      body: loading
          ? const Loader()
          : Container(
              width: double.infinity,
              color: Colors.grey[800],
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.1),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      // height: MediaQuery.of(context).size.height * 0.5,
                      // decoration: BoxDecoration(
                      //   color: Colors.grey[900],
                      //   borderRadius: BorderRadius.circular(20),
                      // ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.file(
                          File(
                            widget.imagePath,
                          ),
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height * 0.5,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
    );
  }
}
