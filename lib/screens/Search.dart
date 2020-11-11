import 'dart:convert';
import 'package:chickywok/helpers/config.dart';
import 'package:chickywok/models/menu-items.dart';
import 'package:chickywok/providers/menu-provider.dart';
import 'package:chickywok/widgets/app-navigation.dart';
import 'package:chickywok/widgets/bottom-navigation.dart';
import 'package:chickywok/widgets/search-list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  void initState() {
    // TODO: implement initState
    super.initState();
    _clearData();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(false),
      bottomNavigationBar: BottomNavigation(),
      body: Column(
        children: <Widget>[
          Container(
            height: 50,
            padding: EdgeInsets.only(left: 10,right: 10),
            child: Container(

              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              child: TextField(
                autofocus: true,
                onChanged: (String value){
                  setSearchText(value);
                },
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.grey,fontSize: 14),
                  prefixIcon:Icon(Icons.search,color: Colors.grey,),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 0.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 0.0),
                  ),
                ),
              ),
            ),
          ),
          Expanded(child: SearchList())
        ],
      ),
    );
  }

  Future<void> _fetchData() async{
    String url = Config.BASE_URL + "/item";
    final response = await http.get(url);
    List<MenuItems> list = (json.decode(response.body) as List).map((data)=>new MenuItems.fromJson(data)).toList();
    Provider.of<MenuProvider>(context,listen: false).setItems(list);
    print(jsonEncode(list));
  }

  Future<void> _clearData() async{
    Provider.of<MenuProvider>(context,listen: false).setSearchText("");
  }

  void setSearchText(String value) {
    Provider.of<MenuProvider>(context,listen: false).setSearchText(value);
  }
}


