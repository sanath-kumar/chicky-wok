import 'package:Chickywok/providers/menu-provider.dart';
import 'package:Chickywok/screens/menu-detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchList extends StatefulWidget {
  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProvider>(
        builder: (context,menuItems,child){

            return Container(
                child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: (1/1.4) ),
                    itemCount: menuItems.filteredItems.length,
                    itemBuilder: (BuildContext context,int index){
                      return Container(
                        padding: EdgeInsets.all(10),
                        child: InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, '/details',arguments: MenuDetailArguments(name: menuItems.filteredItems[index].name,id: menuItems.filteredItems[index].sId,description: menuItems.filteredItems[index].description,price: menuItems.filteredItems[index].mrp,thumbnail: menuItems.filteredItems[index].thumbnail));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                              color: Colors.white,
                              boxShadow: [BoxShadow(blurRadius: 4,spreadRadius: 1,color: Colors.black12)],
                            ),
                            child: Column(
                              children: <Widget>[
                                Hero(
                                  tag : menuItems.filteredItems[index].sId,
                                  child: Image.network(menuItems.filteredItems[index].thumbnail,width: double.infinity,height: 130,),
                                ),
                                SizedBox(height: 15,),
                                Text(menuItems.filteredItems[index].name,style: TextStyle(color: Colors.black),),
                                SizedBox(height: 15,),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.red[700],
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                  ),
                                  padding: EdgeInsets.fromLTRB(30, 6, 30, 6),
                                  child: Text("\u20B9 "+" "+menuItems.filteredItems[index].mrp,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red[100]),),
                                )

                              ],
                            ),
                          ),
                        ),
                      );
                    })
            );
        });
  }
}
