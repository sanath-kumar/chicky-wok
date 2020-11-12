import 'package:Chickywok/providers/menu-provider.dart';
import 'package:Chickywok/screens/menu-detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuList extends StatefulWidget {
  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProvider>(
      builder: (context,menuItems,child){
        if(menuItems.itemCount > 0){
          return  Container(
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: (1/1.4) ),
                  itemCount: menuItems.itemCount,
                  itemBuilder: (BuildContext context,int index){
                    return Container(
                      padding: EdgeInsets.all(10),
                      child: InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, '/details',arguments: MenuDetailArguments(name: menuItems.items[index].name,id: menuItems.items[index].sId,description: menuItems.items[index].description,price: menuItems.items[index].mrp,thumbnail: menuItems.items[index].thumbnail));
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
                                tag : menuItems.items[index].sId,
                                child: Image.network(menuItems.items[index].thumbnail,width: double.infinity,height: 120,),
                              ),
                              SizedBox(height: 15,),
                              Container(padding:EdgeInsets.only(left: 10,right: 10),child: Text(menuItems.items[index].name,textAlign:TextAlign.center,style: TextStyle(color: Colors.black,),)),
                              SizedBox(height: 15,),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.red[700],
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                ),
                                padding: EdgeInsets.fromLTRB(30, 6, 30, 6),
                                child: Text("\u20B9 "+" "+menuItems.items[index].mrp,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red[100]),),
                              )

                            ],
                          ),
                        ),
                      ),
                    );
                  })
          );
        }else{
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(child: CircularProgressIndicator(backgroundColor: Colors.red,valueColor : new AlwaysStoppedAnimation<Color>(Colors.red[100]))),
            ],
          );
        }

      },
    );
  }
}



