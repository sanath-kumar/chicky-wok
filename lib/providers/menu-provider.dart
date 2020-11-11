import 'dart:convert';

import 'package:Chickywok/models/menu-items.dart';
import 'package:flutter/cupertino.dart';

class MenuProvider extends ChangeNotifier{
  String _searchText = "";
  List<MenuItems> _items = [];

  List<MenuItems> get items{
    return _items;
  }

  List<MenuItems> get filteredItems{
    List<MenuItems> list = [];
    for(int i=0;i < _items.length;i++){
      if(_searchText.length>2 && _items[i].name.toUpperCase().contains(_searchText.toUpperCase())){
        list.add(_items[i]);
      }
    }
    print(jsonEncode(list));
    return list;
  }

  String get searchtext{
    return _searchText;
  }

  int get itemCount {
    return _items.length;
  }

  void setItems(List<MenuItems> items){
    _items = items;
    notifyListeners();
  }

  void setSearchText(String text){
    _searchText = text;
    print(_searchText);
    notifyListeners();
  }
}