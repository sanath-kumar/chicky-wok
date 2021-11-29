import 'package:Chickywok/providers/cart-provider.dart';
import 'package:Chickywok/providers/menu-provider.dart';
import 'package:Chickywok/screens/Search.dart';
import 'package:Chickywok/screens/cart.dart';
import 'package:Chickywok/screens/checkout.dart';
import 'package:Chickywok/screens/confirm-checkout.dart';
import 'package:Chickywok/screens/confirm-registration.dart';
import 'package:Chickywok/screens/home-page.dart';
import 'package:Chickywok/screens/locate-store.dart';
import 'package:Chickywok/screens/login.dart';
import 'package:Chickywok/screens/menu-detail.dart';
import 'package:Chickywok/screens/menu.dart';
import 'package:Chickywok/screens/my-account.dart';
<<<<<<< HEAD
import 'package:Chickywok/screens/outlets.dart';
=======
>>>>>>> 646e9026a812406db75c75825f448231cc178384
import 'package:Chickywok/screens/payments.dart';
import 'package:Chickywok/screens/register.dart';
import 'package:Chickywok/screens/registration-complete.dart';
import 'package:Chickywok/screens/select-country.dart';
import 'package:Chickywok/screens/splashscreen.dart';
import 'package:Chickywok/screens/welcome.dart';
import 'package:Chickywok/widgets/locate-me.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MenuProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Montserrat',
        ),
        initialRoute: '/',
        routes: {
          '/' : (context) => SplashScreen(),
          '/register' : (context) => Register(),
          '/home' : (context) => Menu(),
          '/details' : (context) => MenuDetail(),
          '/cart' : (context) => Cart(),
          '/locate-store' : (context)=> LocateStore(),
          '/checkout' : (context) => Checkout(),
          '/login' : (context) => Login(),
          '/payment' : (context) => Payments(),
          '/search' : (context) => Search(),
          '/welcome' : (context) => Welcome(),
          '/confirm-checkout' : (context) => ConfirmCheckout(),
          '/registration-confirmation' : (context) => RegistrationComplete(),
          '/my-account' : (context) => MyAccount(),
          '/confirm-registration' : (context) => ConfirmRegistration(),
          '/outlets' : (context) => Outlets()
        },

      ),
    );
  }
}

