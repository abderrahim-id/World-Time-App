import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location; // Location name for the UI
  String time; // the time in that location
  String flag; // url
  String url; // url of the API for that location

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      // Make the request
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      // Get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // Set the time property
      time = now.toString();
    } catch (e) {
      // e means error
      print('caught error : $e');
      time = 'could not get time';
    }
  }
}
