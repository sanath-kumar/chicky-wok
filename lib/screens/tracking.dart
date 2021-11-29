import 'package:Chickywok/widgets/app-navigation.dart';
import 'package:Chickywok/widgets/bottom-navigation.dart';
import 'package:flutter/material.dart';

class Tracking extends StatefulWidget {
  @override
  _TrackingState createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(false),
      bottomNavigationBar: BottomNavigation(),
      body: Container(

      ),
    );
  }
}
