import 'package:flutter/material.dart';
import 'package:test_three/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading..';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        flag: 'germany.png', location: 'Berlin', url: 'Europe/Berline');
    await instance.getTime();
    // print(instance.time);
    setState(() {
      time = instance.time;
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Text(time),
      ),
    );
  }
}
