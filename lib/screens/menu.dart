import 'dart:convert';

import 'package:Chickywok/helpers/config.dart';
import 'package:Chickywok/models/menu-items.dart';
import 'package:Chickywok/providers/menu-provider.dart';
import 'package:Chickywok/widgets/app-navigation.dart';
import 'package:Chickywok/widgets/bottom-navigation.dart';
import 'package:Chickywok/widgets/carousel.dart';
import 'package:Chickywok/widgets/menu-list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;


class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool isLoading = true;
  List<MenuItems> list;
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(true),
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: BottomNavigation(),
      body: Container(
        child : SingleChildScrollView(
          child: Column(

            children: <Widget>[
              SizedBox(
                width: double.infinity,
                height: 50,
                child: Container(
                  padding: EdgeInsets.only(left: 10,right: 10),
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed('/search');
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.search),
                          SizedBox(width: 10,),
                          Text("Search.."),
                        ],
                      ),
                      decoration: BoxDecoration(color: Colors.grey[200],
                        borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Carousel(),

              Container(padding:EdgeInsets.only(left: 10,top: 20,bottom: 20,right: 10),
                  child: Row(
                    children: <Widget>[
                      Text("OUR",textAlign: TextAlign.right,style: TextStyle(fontSize: 12,color: Colors.grey[700]),),
                      SizedBox(
                        width: 10,
                      ),
                      Text("MENU",textAlign: TextAlign.right,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                      SizedBox(width: 20,height:5,),
                      Expanded(child: Divider(color: Colors.grey,),),

                    ],
                  )),
              MenuList(),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _fetchData() async{
    String url = Config.BASE_URL + "/inventory/allproducts";
    final response = await http.get(url);
    print(json.decode(response.body.toString()));
    list = (json.decode(response.body.toString()) as List).map((data)=>new MenuItems.fromJson(data)).toList();
    Provider.of<MenuProvider>(context,listen: false).setItems(list);

  }
}
