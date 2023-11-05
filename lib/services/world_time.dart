import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';


class WorldTime {
  String location; // location name for the UI
  String time = ""; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  bool isDaytime = true; // true or false if daytime or not

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    var urlGet = Uri.https('www.worldtimeapi.org', '/api/timezone/$url', {'q': '{http}'});
    var response = await http.get(urlGet);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      String datetime = jsonResponse['datetime'];
      print(datetime);
      DateTime now = DateTime.parse(datetime);
      int offset = int.parse(jsonResponse['utc_offset'].substring(0,3));
      now = now.add(Duration(hours: offset));
      time = DateFormat.jm().format(now);
      print(now.toString());
      isDaytime = now.hour > 6 && now.hour < 20;
    } else {
      throw Exception('Failed to load time');
    }
  }
}

