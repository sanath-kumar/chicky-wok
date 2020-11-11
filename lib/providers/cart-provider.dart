import 'dart:convert';
import 'package:Chickywok/helpers/Prefs.dart';
import 'package:Chickywok/models/cart-items.dart';
import 'package:Chickywok/models/my-orders.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';



class CartProvider extends ChangeNotifier{
  List<CartItems> _cart = [];
  List<MyOrders> _myOrders = [];

  List<CartItems> get items{
    return _cart;
  }
  int get cartCount{
    return _cart.length;
  }


  double get total{
    double total = 0;
    for(int i=0;i<_cart.length;i++){
      total += (double.parse(_cart[i].mrp) * double.parse(_cart[i].quantity));
    }
    return total;
  }

  void addToCart(CartItems item){
    if(_cart.length == 0 ){
      _cart.add(item);
    }else{
      if(item.quantity == "0"){
        deleteItem(item.sId);
      }else{
        addItem(item);
      }
    }
    notifyListeners();
    PrefsHelper.saveCart(jsonEncode(_cart));
  }

  void deleteItem(String sId) {
    for(int i=0;i<_cart.length;i++){
      if(_cart[i].sId == sId){
        _cart.removeAt(i);
      }
    }
    PrefsHelper.saveCart(jsonEncode(_cart));
  }

  void addItem(CartItems item) {
    bool found = false;
    int index = 0;
    for(int i=0;i<_cart.length;i++){
      if(_cart[i].sId == item.sId){
        found = true;
        index = i;
      }
    }
    if(found){
      _cart[index].quantity = item.quantity;
    }else{
      _cart.add(item);
    }
  }

  void addQuantity(String id){
    for(int i=0;i<_cart.length;i++){
      if(_cart[i].sId == id){
        int quantity = int.parse(_cart[i].quantity) + 1;
        _cart[i].quantity = quantity.toString();
      }
    }
    notifyListeners();
    PrefsHelper.saveCart(jsonEncode(_cart));
  }

  void reduceQuantity(String id){
    for(int i=0;i<_cart.length;i++){
      if(_cart[i].sId == id){
        int quantity = int.parse(_cart[i].quantity) - 1;
        if(quantity == 0){
          deleteItem(id);
        }else{
          _cart[i].quantity = quantity.toString();
        }

      }
    }
    notifyListeners();
    PrefsHelper.saveCart(jsonEncode(_cart));
  }

  void hydrateCartFromPrefs() async{
    print("hello");
    final prefs = await SharedPreferences.getInstance();
    String cart = prefs.getString("CART");
    print(cart);
    if(cart!=null){
      _cart = (json.decode(cart) as List).map((data)=>new CartItems.fromJson(data)).toList();
      notifyListeners();
    }
  }

  void setMyOrders(List<MyOrders> list){
    _myOrders = list;
    notifyListeners();
  }

  List<MyOrders> get myOrders{
    return _myOrders;
  }

  void flushCart() async{
    _cart.removeRange(0, _cart.length);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("CART", "");
  }

}

