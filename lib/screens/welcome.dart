import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Image.asset("assets/login.png"),
                    SizedBox(
                      height: 30,
                    ),
                    Shimmer.fromColors(baseColor:Colors.red,highlightColor: Colors.red[200],child: Image.asset('assets/logo-transparant.png',width: 250,color: Colors.red,)),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20,right: 20),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: FlatButton(
                      color: Colors.red,
                      onPressed: (){
                        Navigator.pushNamed(context, '/login');
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))
                      ),
                      child: Text("SIGN IN",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    ),
                  ),
                  SizedBox(height: 15,),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: FlatButton(
                      color: Colors.grey[200],
                      onPressed: (){
                        Navigator.pushNamed(context, '/register');
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))
                      ),
                      child: Text("SIGN UP",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  )
                ],
              ),
            )
//            Container(
//              decoration: BoxDecoration(
//                  borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))
//              ),
//              padding: EdgeInsets.fromLTRB(50,10,50,10),
//              child: Column(
//                children: <Widget>[
//                  TextField(
//                    decoration: InputDecoration(
//                      prefixIcon:Icon(Icons.supervisor_account,color: Colors.white,),
//                      enabledBorder: const OutlineInputBorder(
//                        borderSide: const BorderSide(color: Colors.white, width: 0.0),
//                      ),
//                    ),
//                  ),
//                  TextField(
//                    decoration: InputDecoration(
//                      prefixIcon:Icon(Icons.lock_open),
//                      enabledBorder: const OutlineInputBorder(
//                        borderSide: const BorderSide(color: Colors.white, width: 0.0),
//                      ),
//                      focusedBorder: const OutlineInputBorder(
//                        borderSide: const BorderSide(color: Colors.white, width: 0.0),
//                      ),
//                    ),
//                  ),
//                  SizedBox(
//                    height: 10,
//                  ),
//                  Container(
//                      width: double.infinity,
//                      child: Text("Forgot Password",style: TextStyle(),textAlign: TextAlign.right,)),
//                  SizedBox(
//                    height: 10,
//                  ),
//                  SizedBox(
//                    width: double.infinity,
//                    child: RaisedButton(
//                      child: Text("Login"),
//                      color: Colors.white,
//                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
//                      onPressed: (){
//                      },
//                    ),
//                  )
//                ],
//              ),
//            )

          ],
        ),
      ),

    );
  }
}
