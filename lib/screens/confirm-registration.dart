import 'package:flutter/material.dart';

class ConfirmRegistration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        child : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/delivery.png',width: 200,),
            Text("SUCCESS!",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text("You have successfully registered as a member of Chicky Wok. Enjoy your tasty meals from the comfort of your homes",textAlign: TextAlign.center,style: TextStyle(color: Colors.grey),),
            SizedBox(height: 30,),
            RaisedButton(
              child: Text("BACK TO LOGIN",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              color: Colors.red[700],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
              onPressed: (){
                Navigator.pushNamed(context, "/login");
              },
            ),
          ],
        )
      ),
    );
  }
}
