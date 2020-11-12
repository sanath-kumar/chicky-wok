import 'package:Chickywok/models/cart-items.dart';
import 'package:Chickywok/providers/cart-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context,cartProvider,child){
        if(cartProvider.cartCount>0){
          return Container(
            color: Colors.grey[100],
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Container(
              child: ListView.builder(
                  itemCount: cartProvider.cartCount,
                  itemBuilder: (BuildContext context,int index){
                    return Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          boxShadow: [
                            BoxShadow(spreadRadius: 1,blurRadius: 3,color: Colors.black12),
                          ]
                      ),
                      child: Row(
                        children: <Widget>[
                          Image.network(cartProvider.items[index].thumbnail,width: 48,),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                                Text(cartProvider.items[index].name,),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: <Widget>[
                                    Text("\u20B9",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(child: Text((int.parse(cartProvider.items[index].mrp)*int.parse(cartProvider.items[index].quantity)).toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
                                    SizedBox(
                                      width: 100,
                                      child: Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color:Colors.grey[200],
                                          borderRadius: BorderRadius.all(Radius.circular(30)),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Expanded(child: InkWell(
                                                onTap : (){
                                                  Provider.of<CartProvider>(context,listen: false).reduceQuantity(cartProvider.items[index].sId);
                                                },
                                                child: Text("-",textAlign: TextAlign.center, style: TextStyle(color: Colors.black,fontSize: 20,decoration: TextDecoration.none),))),
                                            Expanded(child: Text(cartProvider.items[index].quantity.toString(),textAlign: TextAlign.center, style: TextStyle(color: Colors.black,fontSize: 14,decoration: TextDecoration.none),)),
                                            Expanded(child: InkWell(
                                                onTap : (){
                                                  Provider.of<CartProvider>(context,listen: false).addQuantity(cartProvider.items[index].sId);
                                                },
                                                child: Text("+",textAlign: TextAlign.center, style: TextStyle(color: Colors.black,fontSize: 20,decoration: TextDecoration.none),))),
                                          ],
                                        ),
                                      ),
                                    )

                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          );
        }else{
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(child: Shimmer.fromColors(baseColor:Colors.red[700],highlightColor:Colors.red[200],child: Icon(Icons.add_shopping_cart,size: 64,))),
              SizedBox(height: 20,),
              Center(child: Container(child: Text("YOUR BAG IS EMPTY",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14 ),))),
              SizedBox(height: 20,),
              Center(child: Container(child: SizedBox( width:200,child: Text("Looks like you haven't made your menu yet",textAlign: TextAlign.center, style: TextStyle(color: Colors.black45),)),),),
              SizedBox(height: 20,),
              RaisedButton(onPressed : (){
                  Navigator.pushNamed(context, '/home');
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Text("Back To Menu",style: TextStyle(color: Colors.white),),color: Colors.red[700],)
            ],
          );
        }
      }
    );
  }



}
