import 'package:booking/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class InitialApp extends StatefulWidget {
  InitialApp({Key key}) : super(key: key);

  @override
  State<InitialApp> createState() => _InitialAppState();
}

class _InitialAppState extends State<InitialApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(top: 2, right: 2, left: 2),
                    margin: EdgeInsets.only(left: 1, right: 1, top: 20),
                    // color: Colors.orange,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        
                        Container(
                          padding: EdgeInsets.all(15),
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.4,
                          child:Image.asset('assets/images/bus2.jpg',fit: BoxFit.contain,),
                          decoration: new BoxDecoration(
                            border: Border.all(width: 2,color: Theme.of(context).accentColor),
                            // color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                        ),
                          SizedBox(width: 10),
                        Container(
                          padding: EdgeInsets.all(15),
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.4,
                          child:Image.asset('assets/images/plane4.png',fit: BoxFit.contain,),
                          decoration: new BoxDecoration(
                             border: Border.all(width: 2,color: Theme.of(context).accentColor),
                            // color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                        ),
                       
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    // color: Colors.green,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Text(
                            "Bus & Air Ticket Booking",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Text(
                            "Book your bus and air tickets with us is very easy and fast",
                            style: TextStyle(
                              fontSize: 18,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.15),
                        GestureDetector(
                          onTap: () async {

                            var box = Hive.box("booking");
                                    box.put("firstrun", 1);
                                    // box.put("isagreed", true);
                             Route route = MaterialPageRoute(builder: (c) => LoginPage());
                               Navigator.push(context, route);
                          },
                          child: Container(
                              //padding: EdgeInsets.all(20),
                              margin: EdgeInsets.all(10),
                              height: 50,
                              width: double.infinity,
                              child: Center(
                                child: Text(
                                  "Get Started",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
