import 'dart:io';

import 'package:el_red/model/screen1_model.dart';
import 'package:el_red/utils/constants.dart';
import 'package:http/http.dart' as http;

class Data {
  getData() async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Screen1 screen1Model = screen1FromJson(response.body);
        return screen1Model;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } on SocketException {
      print('No Internet connection 😑');
    } catch (e) {
      print(e);
    }
  }
}
