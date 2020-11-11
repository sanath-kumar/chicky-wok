import 'package:Chickywok/widgets/app-navigation.dart';
import 'package:Chickywok/widgets/bottom-navigation.dart';
import 'package:Chickywok/widgets/locate-me.dart';
import 'package:flutter/material.dart';
class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  String address="",landmark="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(false),
      bottomNavigationBar: BottomNavigation(),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: LocateMe(),
            ),
            Container(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "DELIVER TO",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    onChanged: (String value){
                      setState(() {
                        address = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Address",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                      prefixIcon: Icon(
                        Icons.map,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  TextField(
                    onChanged: (String value){
                      setState(() {
                        landmark = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Landmark",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                      prefixIcon: Icon(
                        Icons.location_on,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      onPressed: (){
                        if(address=="" || landmark == ""){
                          showDialog(context: context,builder: (BuildContext context){
                            return AlertDialog(
                              title: Text("Empty Delivery Point"),
                              content: Text("Please mention your delivery location"),
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
                        }else{
                          Navigator.pushNamed(context, "/confirm-checkout");
                        }

                      },
                      color: Colors.red,
                      child: Text("CHECKOUT",style: TextStyle(color: Colors.white),),
                    ),
                  )

                ],
              ),
            )

          ],
        ),
      ),

    );
  }
}
