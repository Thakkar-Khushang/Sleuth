import 'dart:io';
import 'package:http/http.dart' as http;

Future asyncFileUpload(File imageFile) async {
  var request = http.MultipartRequest("POST",
      Uri.parse("https://sleuth-development.up.railway.app/findCriminal"));
  var pic = await http.MultipartFile.fromPath("file", imageFile.path);
  request.files.add(pic);
  var response = await request.send();
  var responseData = await response.stream.toBytes();
  var responseString = String.fromCharCodes(responseData);
  print(responseString);
  return responseString;
}
