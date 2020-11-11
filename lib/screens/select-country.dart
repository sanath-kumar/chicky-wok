import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class SelectCountry extends StatefulWidget {
  @override
  _SelectCountryState createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  String country="";
  String country_code="";
  @override
  Future<void> initState(){
    // TODO: implement initState
    super.initState();
    locateCountry();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: DisplayCountry(name: country,code: country_code,),
      ),
    );
  }

  void locateCountry() async{
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemark[0].country);
    setState(() {
      country = placemark[0].country.toUpperCase();
      country_code = "in";
    });
  }
}

class DisplayCountry extends StatelessWidget {
  String name;
  String code;

  DisplayCountry({this.name,this.code});

  @override
  Widget build(BuildContext context) {
    if(name!=""){
      return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  <Widget>[

            Image.network("https://www.countryflags.io/$code/flat/64.png"),
            SizedBox(height: 5,),
            Text(name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,),),
            SizedBox(height: 50,),
            FloatingActionButton(
              backgroundColor: Colors.red,
              child: Icon(Icons.arrow_forward),
              onPressed: (){

              },
            )
          ]
      );
    }else{
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("FINDING COUNTRY"),
        ],
      );
    }
  }
}
