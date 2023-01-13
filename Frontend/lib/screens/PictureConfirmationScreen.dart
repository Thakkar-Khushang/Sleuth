import 'package:flutter/material.dart';
import 'package:sleuth/components/loader.dart';

class PictureConfirmationScreen extends StatefulWidget {
  const PictureConfirmationScreen({
    Key? key,
  }) : super(key: key);

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
                  onPressed: () async {},
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
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              )),
    );
  }
}
