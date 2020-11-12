import 'dart:async';

import 'package:Chickywok/widgets/bottom-navigation.dart';
import 'package:Chickywok/widgets/locate-me.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigation(),
        body: SafeArea(
            child : Container(child: Column(
              children: <Widget>[
                Expanded(
                  child: LocateMe(),
                ),

              ],
            ))

        )

    );
  }
}
