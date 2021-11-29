import 'dart:convert';

import 'package:badges/badges.dart';
import 'package:Chickywok/helpers/Prefs.dart';
import 'package:Chickywok/helpers/config.dart';
import 'package:Chickywok/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:progress_dialog/progress_dialog.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  ProgressDialog progressDialog;
  String phone,password;
  @override
  Widget build(BuildContext context) {
    progressDialog = new ProgressDialog(context);
    progressDialog.style(
        message: "Verifying Your Account",
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0)
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children : <Widget>[Container(
          width: double.infinity,
          color: Colors.white,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                Container(
                  padding: EdgeInsets.fromLTRB(20, 60, 20, 50),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 50,),
                      Text("LOGIN",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                      SizedBox(height: 15,),
                      Text("Login with your",style: TextStyle(color: Colors.black54),),
                      Text("Phone Number and Password",style: TextStyle(color: Colors.black54)),
                      SizedBox(height: 15,),
                      SizedBox(width: 80,height:5,child: Divider(color: Colors.red[700],),),
                      SizedBox(width: 60,height:5,child: Divider(color: Colors.red[700],),),
                      SizedBox(height: 50,),
                      TextField(
                        onChanged: (String value){
                          phone = value;
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: "Phone Number",
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
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        onChanged: (String value){
                          password = value;
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
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: RaisedButton(
                          child: Text("SIGN IN",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          color: Colors.red[700],
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                          onPressed: (){
                            login();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          width: double.infinity,
                          child: Text("Forgot Password ? ",style: TextStyle(color: Colors.red[900]),textAlign: TextAlign.center,)),

                    ],
                  ),
                )

              ],
            ),
          ),
          Align(alignment:Alignment.bottomRight,child: Image.asset("assets/login-bottom.png",width: 200,)),
        ],
      ),

    );
  }

  void login() async{
    progressDialog.show();
    final http.Response response = await http.post(
      Config.BASE_URL + '/auth/signin' ,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "phone" : phone,
        "password" : password
      }),
    );
    progressDialog.hide();
    bool success = UserDetails.fromJson(jsonDecode(response.body)).success;
    if(success){
      PrefsHelper.setUser(response.body);
      Navigator.pushNamed(context, "/home");
    }else{
      showDialog(context: context,builder: (BuildContext context){
        return AlertDialog(
          title: Text("Account Not Found"),
          content: Text("Please verify"),
          actions: <Widget>[
            FlatButton(
              child: Text("close"),
              onPressed: (){
                Navigator.of(context).pop();
              },
            )
          ],
        );
      });
    }
  }

}
