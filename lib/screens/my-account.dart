import 'dart:convert';
import 'package:chickywok/helpers/config.dart';
import 'package:chickywok/models/my-orders.dart';
import 'package:chickywok/models/user.dart';
import 'package:chickywok/providers/cart-provider.dart';
import 'package:chickywok/widgets/app-navigation.dart';
import 'package:chickywok/widgets/bottom-navigation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/date_symbol_data_local.dart';

class MyAccount extends StatefulWidget {

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  String name="",phone="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchMyOrders();
    getUser();
  }
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();

    return Scaffold(
      appBar: TopBar(false),
      bottomNavigationBar: BottomNavigation(),
      body : Consumer<CartProvider>(
        builder: (context,cartProvider,child){
          return SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(name,style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(phone),
                  ],
                ),
                SizedBox(height: 15,),
                Divider(),
                SizedBox(height: 25,),

                RichText(
                  text: TextSpan(
                    children: [

                      WidgetSpan(
                        child: Icon(Icons.home, size: 18),
                      ),
                      WidgetSpan(
                        child: SizedBox(width: 30,)
                      ),
                      TextSpan(
                        text: "Manage Address",
                        style: TextStyle(color: Colors.grey,fontSize: 18)
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25,),
                RichText(
                  text: TextSpan(
                    children: [

                      WidgetSpan(
                        child: Icon(Icons.credit_card, size: 18),
                      ),
                      WidgetSpan(
                          child: SizedBox(width: 30,)
                      ),
                      TextSpan(
                          text: "Payment",
                          style: TextStyle(color: Colors.grey,fontSize: 18)
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25,),
                RichText(
                  text: TextSpan(
                    children: [

                      WidgetSpan(
                        child: Icon(Icons.favorite, size: 18),
                      ),
                      WidgetSpan(
                          child: SizedBox(width: 30,)
                      ),
                      TextSpan(
                          text: "Favourites",
                          style: TextStyle(color: Colors.grey,fontSize: 18)
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25,),
                RichText(
                  text: TextSpan(
                    children: [

                      WidgetSpan(
                        child: Icon(Icons.redeem, size: 18),
                      ),
                      WidgetSpan(
                          child: SizedBox(width: 30,)
                      ),
                      TextSpan(
                          text: "Offers",
                          style: TextStyle(color: Colors.grey,fontSize: 18)
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Divider(),
                SizedBox(height: 20,),
                Text("YOUR ORDERS",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: cartProvider.myOrders.length,
                    itemBuilder: (BuildContext context,int index){
                  return Container(
                      child : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         SizedBox(height: 10,),
                         Text(DateFormat("dd-MM-yyyy").format(DateTime.parse(cartProvider.myOrders[index].created))),
                         SizedBox(height: 7,),
                         Text(cartProvider.myOrders[index].items, style: TextStyle(fontSize: 13,color: Colors.grey),),
                         SizedBox(height: 20,),
                         Row(
                           children: <Widget>[
                             Text("Rs. " + cartProvider.myOrders[index].total,style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                             Expanded(child: Text("Your Meal is Being Prepared",textAlign: TextAlign.right, style: TextStyle(color: Colors.green[700]),))
                           ],
                         ),

                         SizedBox(height: 10,),
                         Divider(),
                       ],
                      )

                  );
                }),
              ],
            ),
          );
        }

      )
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
    });

  }

  Future<void> _fetchMyOrders() async{
    List<MyOrders> list;
    final prefs = await SharedPreferences.getInstance();
    String userDetails = prefs.getString("USER");
    print(userDetails);
    UserDetails user = UserDetails.fromJson(json.decode(userDetails));
    String url = Config.BASE_URL + "/order?id="+user.user.sId;
    final response = await http.get(url);
    list = (json.decode(response.body) as List).map((data)=>new MyOrders.fromJson(data)).toList();
    Provider.of<CartProvider>(context,listen: false).setMyOrders(list);
  }
}

