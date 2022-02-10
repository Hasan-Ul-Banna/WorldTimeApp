import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
class ChooseLocation extends StatefulWidget {

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<worldTime> locations = [
    worldTime(location: 'Dhaka', flag: 'bangladesh.png', url: 'Asia/Dhaka'),
    worldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    worldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    worldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    worldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    worldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    worldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    worldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    worldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];
  void updateTime( worldTime instance) async {
    await instance.getTime();
    Navigator.pop(context,
      {
        'location': instance.location,
        'time': instance.time,
        'flag': instance.flag,
        'isDay': instance.isDay
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Location'),
      ),
      body: ListView.builder(itemCount: locations.length,
        itemBuilder: (BuildContext context,int index){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 6.0),
          child: Card(
            child: ListTile(
              onTap: (){
                updateTime(locations[index]);
              },
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),
              title: Text(locations[index].location),
            ),
          ),
        );
        },
      ),
    );
  }
}
