import 'dart:convert';

import 'package:Chickywok/helpers/Prefs.dart';
import 'package:Chickywok/models/user.dart';
import 'package:Chickywok/widgets/app-navigation.dart';
import 'package:Chickywok/widgets/bottom-navigation.dart';
import 'package:Chickywok/widgets/my-cart.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  UserDetails user;
  bool check = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: TopBar(false),
      bottomNavigationBar: BottomNavigation(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if(true) Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                children: <Widget>[
                  Expanded(child: Text("My Menu",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,),)),
                  RaisedButton(onPressed: (){
                    Navigator.pushNamed(context, '/checkout');
                  },
                    color: Colors.red[700],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Text("Checkout",style: TextStyle(color: Colors.white),),
                  )
                ],
              )),
          Expanded(child: MyCart()),
          
        ],
      ),
    );
  }

  void getUser() async{
    final prefs = await SharedPreferences.getInstance();
    String userDetails = prefs.getString("USER");
    print(userDetails);
    UserDetails user = UserDetails.fromJson(json.decode(userDetails));
    print(user.user.name);

  }
}
