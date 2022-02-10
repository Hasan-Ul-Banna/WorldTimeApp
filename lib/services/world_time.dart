import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class worldTime {
  String location;
  late String time;
  String url;
  String flag;
  late bool isDay;

  worldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      String dateTime = data['datetime'];
      String offset = data['utc_offset'];
      List <String>hrMn = offset.split(':');
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(hrMn[0]), minutes: int.parse(hrMn[1])));
      isDay = now.hour > 2 && now.hour < 18? true:false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('The error is $e');
      time = 'Failed to get time';
      isDay = false;
    }
  }
}
