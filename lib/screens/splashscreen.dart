import 'dart:async';

import 'package:chickywok/models/user.dart';
import 'package:chickywok/providers/cart-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 2),
        () => {
            navigate()
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 50,right: 50),
      color: Colors.red,
      child:
      Shimmer.fromColors(
          baseColor:Colors.white,
          highlightColor: Colors.red[100],
          child: SizedBox(width:100,child: Image.asset("assets/logo-transparant.png",width: 200,))),
      );
  }

  navigate() async{
    final prefs = await SharedPreferences.getInstance();
    String userDetails = prefs.getString("USER");
    print(userDetails);
    if(userDetails == null || userDetails == ""){
      Navigator.pushNamed(context, "/welcome");
    }else{
      print("Logged in");
      Provider.of<CartProvider>(context,listen: false).hydrateCartFromPrefs();
      Navigator.pushNamed(context, "/home");
    }

  }
}
