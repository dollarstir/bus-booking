import 'package:flutter/material.dart';
import './HomePage.dart';
import 'loginPage.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'initialapp.dart';
// import 'initialterms.dart';
import 'package:awesome_notifications/awesome_notifications.dart';


import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  final dir = await path.getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  await Hive.openBox("booking");

  AwesomeNotifications().initialize('resource://drawable/res_notification', [
    NotificationChannel(
        channelKey: "basic_channel",
        channelName: "Basic Notifications",
        channelDescription: "OnlinTicket" ,
        defaultColor: Colors.blueAccent,
        importance: NotificationImportance.High,
        channelShowBadge: true)
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  Widget pageChecher(){
  var box =  Hive.box('booking');
    // var firstTime = box.get("firstTime");
    var islogin =  box.get("islog");
    var isfirstime =  box.get("firstrun");

   try{
     if (islogin == 1) {
      return HomeScreen();
    }
    else{

      if(isfirstime == null){
        return InitialApp();
        // return LoginPage();
      }
      else{

      return LoginPage();
      }

    }
   }catch (e) {
     print (e);
   }
  
  
  }
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Bus & Flight Booking',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
    //     textTheme: GoogleFonts.latoTextTheme(
    //   Theme.of(context).textTheme,
    // ),
    textTheme:GoogleFonts.montserratTextTheme(Theme.of(context).textTheme,),
        primarySwatch: Colors.green,
      ), 

      
      home:AnimatedSplashScreen(
            duration: 3000,
            splash: Image.asset('assets/images/bus5.png',width: double.infinity,height: 500,),
            nextScreen:pageChecher(),
            splashTransition: SplashTransition.scaleTransition,
            // pageTransitionType: pageTransitionTy
            backgroundColor: Colors.white),
      //  ,
    );
  }
  
}

