import 'package:badges/badges.dart';
import 'package:Chickywok/providers/cart-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    
    return PreferredSize(
      preferredSize: Size(double.infinity, 60),
      child: Consumer<CartProvider>(
        builder: (context,cartProvider,child){
          return Container(
            padding: EdgeInsets.only(left: 10,right: 10),
            height: 60,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 2)
            ]),
            child: Row(

              children: <Widget>[
                Expanded(
                    child: InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, "/home");
                      },
                      child: Container(
                        child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ModalRoute.of(context).settings.name == '/home' ? Image.asset('assets/icon.png',height: 24,) : Image.asset('assets/icon-greyscale.png',width: 28,),
                                SizedBox(height: 1,),
                                Text(
                                  "CHICKY WOK",
                                  style: TextStyle(color: Colors.black, fontSize: 10,fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                      ),
                    )),
                Expanded(
                    child: InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, "/locate-store");
                      },
                      child: Container(
                        child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.near_me,
                                  color: Colors.black12,
                                ),
                                SizedBox(height: 1,),
                                Text(
                                  "OUTLETS",
                                  style: TextStyle(color: Colors.black, fontSize: 10,fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                      ),
                    )),
                Expanded(
                    child: InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, "/cart");
                      },
                      child: Container(
                        child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Badge(
                                  badgeColor: Colors.redAccent,
                                  badgeContent: Text(cartProvider.cartCount.toString(),style: TextStyle(color: Colors.white),),
                                  child: Icon(Icons.shopping_basket,color: Colors.black12,),
                                ),
                                SizedBox(height: 1,),
                                Text(
                                  "CART",
                                  style: TextStyle(color: Colors.black, fontSize: 10,fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                      ),
                    )),
                Expanded(
                    child: InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, '/my-account');
                      },
                      child: Container(
                        child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.menu,
                                  color: Colors.black12,
                                ),
                                SizedBox(height: 1,),
                                Text(
                                  "ACCOUNT",
                                  style: TextStyle(color: Colors.black, fontSize: 10,fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                      ),
                    )),
              ],
            ),
          );
        }

      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize {
    return Size.fromHeight(60);
  }
}
