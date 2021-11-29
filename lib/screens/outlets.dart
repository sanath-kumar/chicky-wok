import 'package:Chickywok/widgets/app-navigation.dart';
import 'package:Chickywok/widgets/bottom-navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Outlets extends StatefulWidget {
  @override
  _OutletsState createState() => _OutletsState();
}

class _OutletsState extends State<Outlets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(false),
      bottomNavigationBar: BottomNavigation(),
      floatingActionButton: FloatingActionButton.extended(

        onPressed: () {
          Navigator.pushNamed(context, "/locate-store");
        },
        label: Text('View On Map'),
        icon: Icon(Icons.navigation),
        backgroundColor: Colors.pink,

      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [new BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0,
              ),]),
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Image.asset("assets/bg.jpg",width: 150,),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("OUTLET NAME",style: TextStyle(fontWeight: FontWeight.bold),),
                          Text("Address, Line 1",style: TextStyle(fontSize: 12),),
                          Text("Address, Line 2",style: TextStyle(fontSize: 12)),
                          Text("Landmark, Dubai",style: TextStyle(fontSize: 12)),
                        ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [new BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                  ),]),
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Image.asset("assets/bg.jpg",width: 150,),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("OUTLET NAME",style: TextStyle(fontWeight: FontWeight.bold),),
                        Text("Address, Line 1",style: TextStyle(fontSize: 12),),
                        Text("Address, Line 2",style: TextStyle(fontSize: 12)),
                        Text("Landmark, Dubai",style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
