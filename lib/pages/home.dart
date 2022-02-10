import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data =
        data.isEmpty ? ModalRoute.of(context)?.settings.arguments as Map : data;
    String bgImage = data['isDay'] ? 'assets/day.jpeg' : 'assets/night.jpeg';
    Color? bgColor = data['isDay'] ? Colors.blue : Colors.indigo[800];
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(bgImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
            child: Column(
              children: [
                SizedBox(
                  height: 50.0,
                ),
                Center(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(
                          context, '/choose_location');
                      setState(() {
                        data = {
                          'location': result['location'],
                          'time': result['time'],
                          'flag': result['flag'],
                          'isDay': result['isDay'],
                        };
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.edit_location,
                          color: Colors.white70,
                        ),
                        SizedBox(width: 4.0,),
                        Text(
                          'Edit Location',
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 49.0,
                ),
                Text(
                  data['location'],
                  style: TextStyle(
                    fontSize: 28.0,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 30.0),
                Text(
                  data['time'],
                  style: TextStyle(
                      fontSize: 50.0,
                      letterSpacing: 2.0,
                      color: Colors.white70),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
