import 'package:chickywok/providers/cart-provider.dart';
import 'package:chickywok/providers/menu-provider.dart';
import 'package:chickywok/screens/Search.dart';
import 'package:chickywok/screens/cart.dart';
import 'package:chickywok/screens/checkout.dart';
import 'package:chickywok/screens/confirm-checkout.dart';
import 'package:chickywok/screens/confirm-registration.dart';
import 'package:chickywok/screens/home-page.dart';
import 'package:chickywok/screens/locate-store.dart';
import 'package:chickywok/screens/login.dart';
import 'package:chickywok/screens/menu-detail.dart';
import 'package:chickywok/screens/menu.dart';
import 'package:chickywok/screens/my-account.dart';
import 'package:chickywok/screens/payments.dart';
import 'package:chickywok/screens/register.dart';
import 'package:chickywok/screens/registration-complete.dart';
import 'package:chickywok/screens/select-country.dart';
import 'package:chickywok/screens/splashscreen.dart';
import 'package:chickywok/screens/welcome.dart';
import 'package:chickywok/widgets/locate-me.dart';
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
          '/outlets' : (context)=> LocateStore(),
          '/checkout' : (context) => Checkout(),
          '/login' : (context) => Login(),
          '/payment' : (context) => Payments(),
          '/search' : (context) => Search(),
          '/welcome' : (context) => Welcome(),
          '/confirm-checkout' : (context) => ConfirmCheckout(),
          '/registration-confirmation' : (context) => RegistrationComplete(),
          '/my-account' : (context) => MyAccount(),
          '/confirm-registration' : (context) => ConfirmRegistration(),
        },

      ),
    );
  }
}

