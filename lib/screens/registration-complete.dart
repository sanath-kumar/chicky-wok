import 'package:flutter/material.dart';

class RegistrationComplete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Image.asset('assets/delivery.png',width: 200,),
            SizedBox(height: 30,),
            Text("CONGRATULATIONS!!",style: TextStyle(fontWeight: FontWeight.bold,),),
            SizedBox(height: 20,),
            Text("You're all set to make your first Order. Login to continue!",textAlign: TextAlign.center,),
            SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child : RaisedButton(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                onPressed: (){
                  Navigator.pushNamed(context, "/login");
                },
                child: Text("LOGIN NOW",style: TextStyle(color: Colors.white),),
              )
            )
          ],
        ),
      ),
    );
  }
}
