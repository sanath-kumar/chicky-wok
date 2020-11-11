import 'dart:convert';

import 'package:chickywok/helpers/config.dart';
import 'package:chickywok/models/cart-items.dart';
import 'package:chickywok/models/user.dart';
import 'package:chickywok/providers/cart-provider.dart';
import 'package:chickywok/widgets/app-navigation.dart';
import 'package:chickywok/widgets/bottom-navigation.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ConfirmCheckout extends StatefulWidget {
  @override
  _ConfirmCheckoutState createState() => _ConfirmCheckoutState();
}

class _ConfirmCheckoutState extends State<ConfirmCheckout> {
  String name="",phone="",userId="",items="",total="";
  ProgressDialog progressDialog;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }
  @override
  Widget build(BuildContext context) {
    progressDialog = new ProgressDialog(context);
    progressDialog.style(
        message: "Placing Your Order",
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0)
    );

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: TopBar(false),
      bottomNavigationBar: BottomNavigation(),
      body: SingleChildScrollView(
        child: Consumer<CartProvider>(
          builder: (context,cartProvider,child){
            return Container(
              padding: EdgeInsets.only(left:20,right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.grey[300],spreadRadius: 2,blurRadius: 5)],
                        color: Colors.white
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.account_circle,size: 48,color: Colors.grey,),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(name,style: TextStyle(fontWeight: FontWeight.bold),),
                            Text(phone),
                          ],
                        )
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.grey[300],spreadRadius: 2,blurRadius: 5)],
                        color: Colors.white
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "YOUR BILL",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(child: Text("Total")),
                            Expanded(child: Text("Rs. "+cartProvider.total.toString())),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(child: Text("Delivery Charges")),
                            Expanded(child: Text("Rs 20")),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(child: Text("Total Payable")),
                            Expanded(child: Text("Rs. "+(cartProvider.total+20).toString())),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
//              SizedBox(
//                width: double.infinity,
//                child: RaisedButton(
//                  color: Colors.blue[700],
//                  shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.all(Radius.circular(30))),
//                  child: Row(
//                    crossAxisAlignment: CrossAxisAlignment.center,
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      Icon(Icons.payment,color: Colors.blue[100],),
//                      SizedBox(width: 10,),
//                      Text("PAY WITH GOOGLE PAY", style: TextStyle(color: Colors.blue[100],fontWeight: FontWeight.bold),),
//                    ],
//                  ),
//                  onPressed: () {
//                    createOrder();
//                  },
//                ),
//              ),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Text("PAY ON DELIVERY",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      onPressed: () {
                        createOrder();
                      },
                    ),
                  ),
                ],
              ),
            );
          }

        ),
      ),
    );
  }
  void getUser() async{
    final prefs = await SharedPreferences.getInstance();
    String userDetails = prefs.getString("USER");
    print(userDetails);
    UserDetails user = UserDetails.fromJson(json.decode(userDetails));
    setState(() {
      name = user.user.name;
      phone = user.user.phone;
      userId = user.user.sId;
    });

  }

  void createOrder() async{
    progressDialog.show();
    String itms = "";
    int total = 0;
    List<CartItems> items = Provider.of<CartProvider>(context,listen: false).items;
    for(int i=0;i< items.length;i++){
      itms += items[i].name + " " + " x " + " " + items[i].quantity;
      total += (int.parse(items[i].mrp) * int.parse(items[i].quantity));
      print(total.toString());
      print(itms);
    }
    final http.Response response = await http.post(
      Config.BASE_URL + '/order' ,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "user" : userId,
        "items" : itms,
        "total" : total.toString()
      }),
    );
    progressDialog.hide();
    Provider.of<CartProvider>(context,listen: false).flushCart();
    Navigator.pushNamed(context, '/my-account');
  }
}
