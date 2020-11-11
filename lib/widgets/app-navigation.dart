import 'package:chickywok/providers/cart-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  bool home;
  TopBar(this.home);
  @override
  Widget build(BuildContext context) {

    return PreferredSize(
      preferredSize: Size(double.infinity,100),
      child: Consumer<CartProvider>(
        builder: (context,cartProvider,cart){
          return Container(
            decoration: BoxDecoration(
            ),
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Container(
              color: Colors.grey[100],
              child: Container(
                padding: EdgeInsets.only(top: 25,left: 10,right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    if(!home) InkWell(onTap:(){
                      Navigator.pop(context);
                    },child: Icon(Icons.navigate_before,size: 40)),
                    if(home) Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Chicky Wok",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                          Text("My Tasty Choice",style: TextStyle(fontSize: 10,color: Colors.grey),),
                        ],
//

                      ),
//
                    ),
                    Row(
                      children: <Widget>[
                        Shimmer.fromColors(baseColor:Colors.red,highlightColor:Colors.red[100],child: Icon(Icons.shopping_basket,size: 20,color: Colors.red,)),
                        SizedBox(width: 10,),
                        Text("\u20B9",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.red),),
                        SizedBox(width: 5,),
                        Text(cartProvider.total.toStringAsFixed(2),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),




                      ],
                    )

                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize  {
    return new Size.fromHeight(100);
  }


}
