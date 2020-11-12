import 'package:Chickywok/models/cart-items.dart';
import 'package:Chickywok/providers/cart-provider.dart';
import 'package:Chickywok/widgets/app-navigation.dart';
import 'package:Chickywok/widgets/bottom-navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class MenuDetail extends StatefulWidget {
  @override
  _MenuDetailState createState() => _MenuDetailState();
}

class _MenuDetailState extends State<MenuDetail> {
  int quantity = 0;
  MenuDetailArguments args;
  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: TopBar(false),
      bottomNavigationBar: BottomNavigation(),
      body: Container(
        color: Colors.grey[100],
        child: Column(
          children: <Widget>[
            Expanded(
              child: Hero(
                  tag: args.id,
                  child: Image.network(args.thumbnail,width: double.infinity,)),

            ),
            Expanded(

              child: Stack(
                children : <Widget>[

                  Container(
                    margin: EdgeInsets.only(top: 25),
                    width: double.infinity,
                    height: double.infinity,
                    padding: EdgeInsets.fromLTRB(20, 50, 20, 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [BoxShadow(blurRadius: 10,spreadRadius: 2,color: Colors.black12)],
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(args.name,style: TextStyle(fontSize: 22,),),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    Text("\u20B9",style: TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.bold),),
                                    SizedBox(width: 5,),
                                    Text(args.price,style: TextStyle(fontSize: 30,color: Colors.black,),),
                                  ],
//
                                ),
                                padding: EdgeInsets.only(top: 2),
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: '',
                                style: TextStyle(color: Colors.black),
                                children: [
                                  WidgetSpan(
                                    child: Shimmer.fromColors(
                                        baseColor:Colors.red,
                                        highlightColor: Colors.red[100],
                                        child: Icon(Icons.star, size: 20)),
                                  ),
                                  TextSpan(text: ' 4.9', style: TextStyle(fontSize: 12,color: Colors.black45)),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            RichText(
                              text: TextSpan(
                                text: '',
                                style: TextStyle(color: Colors.black),
                                children: [
                                  WidgetSpan(
                                    child: Icon(Icons.timer, size: 20),
                                  ),
                                  TextSpan(text: ' 20-30 Mins', style: TextStyle(fontSize: 12,color: Colors.black45)),
                                ],
                              ),
                            ),

                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Text(args.description, style: TextStyle(color: Colors.black45),)
                      ],
                    ),
                  ),
                  Positioned(
                    top: .0,
                    left: .0,
                    right: .0,
                    child: SizedBox(
                        width: 200,
                        height: 50,
                        child: Container(
                          padding: EdgeInsets.only(left: 100,right: 100),
                          child: Container(
                            padding: EdgeInsets.only(top: 10,bottom: 10,left: 5,right: 5),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(child: InkWell(onTap : removeItem,child: Text("-",textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontSize: 25,decoration: TextDecoration.none),))),
                                Expanded(child: Text(quantity.toString(),textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontSize: 25,decoration: TextDecoration.none),)),
                                Expanded(child: InkWell(onTap : addItem,child: Text("+",textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontSize: 25,decoration: TextDecoration.none),))),
                              ],
                            ),
                          ),
                        ),
                      ),

                  ),
                ]
              ),
              ),


          ],
        ),
      ),
    );
  }

  void addItem() {
      setState(() {
        quantity += 1;
        CartItems item = new CartItems(name: args.name,sId: args.id,thumbnail: args.thumbnail,description: args.description,mrp:args.price,quantity: quantity.toString(),total: (double.parse(args.price)*quantity).toString());
        Provider.of<CartProvider>(context,listen: false).addToCart(item);
      });
  }

  void removeItem() {
    setState(() {
      if(quantity!= 0){
        quantity -= 1;
        CartItems item = new CartItems(name: args.name,sId: args.id,thumbnail: args.thumbnail,description: args.description,mrp:args.price,quantity: quantity.toString(),total: (double.parse(args.price)*quantity).toString());
        Provider.of<CartProvider>(context,listen: false).addToCart(item);
      }

    });
  }
}

class MenuDetailArguments{
  String id;
  String name;
  String price;
  String description;
  String thumbnail;

  MenuDetailArguments({this.id,this.name,this.price,this.description,this.thumbnail});
}