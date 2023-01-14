import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

Future asyncFileUpload(File imageFile) async {
  log("Uploading file: ${imageFile.path}");
  var request = http.MultipartRequest(
      "POST", Uri.http("10.0.2.2:3000", "/findCriminal"))
    ..files.add(await http.MultipartFile.fromPath("file", imageFile.path));

  // request.files.add(pic);
  var response = await request.send();
  log(response.statusCode.toString());

  //Get the response from the server
  var responseData = await response.stream.toBytes();
  var responseString = String.fromCharCodes(responseData);
  log(responseString);
  return responseString;
}
