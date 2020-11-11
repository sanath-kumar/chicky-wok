import 'dart:convert';

import 'package:chickywok/helpers/config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:progress_dialog/progress_dialog.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  ProgressDialog progressDialog;
  bool isLoading = false;
  String name="",phone="",password="",confirmPassword="";
  @override
  Widget build(BuildContext context) {
    progressDialog = new ProgressDialog(context);
    progressDialog.style(
      message: "Creating Your Account. Please wait..!",
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0)
    );
    return Scaffold(
      body : SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20,),
                Text("SIGN UP",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                SizedBox(height: 15,),
                Text("Register Now And Get",style: TextStyle(color: Colors.black54),),
                Text("Your Tasty Meals, Delivered At Your Doors",style: TextStyle(color: Colors.black54)),
                SizedBox(height: 15,),
                SizedBox(width: 80,height:5,child: Divider(color: Colors.red[700],),),
                SizedBox(width: 60,height:5,child: Divider(color: Colors.red[700],),),
                SizedBox(height: 50,),
                TextField(
                  onChanged: (String value){
                    setState(() {
                      name = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Your Name",
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 14),
                    prefixIcon:Icon(Icons.account_circle,color: Colors.grey,),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: const BorderSide(color: Colors.black, width: 0.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: const BorderSide(color: Colors.black, width: 0.0),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  onChanged: (String value){
                    setState(() {
                      phone = value;
                    });
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "Phone",
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 14),
                    prefixIcon:Icon(Icons.phone_iphone,color: Colors.grey,),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: const BorderSide(color: Colors.black, width: 0.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: const BorderSide(color: Colors.black, width: 0.0),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  onChanged: (String value){
                    setState(() {
                      password = value;
                    });
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 14),
                    prefixIcon:Icon(Icons.lock_open,color: Colors.grey,),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: const BorderSide(color: Colors.black, width: 0.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: const BorderSide(color: Colors.black, width: 0.0),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  onChanged: (String value){
                    setState(() {
                      confirmPassword = value;
                    });
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Repeat Password",
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 14),
                    prefixIcon:Icon(Icons.lock_open,color: Colors.grey,),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: const BorderSide(color: Colors.black, width: 0.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: const BorderSide(color: Colors.black, width: 0.0),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    child: Text("SIGN UP",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    color: Colors.red[700],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                    onPressed: () async{
                      await progressDialog.show();
                      register();
//                      await progressDialog.hide();
                    },
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }

//  Future<http.Response> register() async{
//
//    return http.post(
//      Config.BASE_URL + '/auth/signup' ,
//      headers: <String, String>{
//        'Content-Type': 'application/json; charset=UTF-8',
//      },
//      body: jsonEncode(<String, String>{
//        "name" : name,
//        "phone" : phone,
//        "password" : password
//      }),
//    );
//  }

  void register() async{
    progressDialog.show();
    final http.Response response = await http.post(
      Config.BASE_URL + '/auth/signup' ,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "name" : name,
        "phone" : phone,
        "password" : password
      }),
    );
    progressDialog.hide();
    Navigator.pushNamed(context, "/confirm-registration");
  }
}



