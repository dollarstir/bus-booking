import 'package:booking/SignUpPage2.dart';
import 'package:flutter/material.dart';

// import 'SignUpPage2.dart';  
import 'loginPage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:sweetalert/sweetalert.dart';
import 'package:country_picker/country_picker.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
// import './signUpPage.dart';
import 'dart:async';

import 'package:intl/intl.dart';

class Busbook extends StatefulWidget {
  @override
  _BusbookPageState createState() => _BusbookPageState();
}

class _BusbookPageState extends State<Busbook> {
  TextEditingController _email = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _gender = TextEditingController();

  TextEditingController _dateOfBirth = TextEditingController();
  TextEditingController _contact = TextEditingController();
  TextEditingController _country = TextEditingController();
  TextEditingController _region = TextEditingController();

  TextEditingController _password = TextEditingController();
  var _loginEmail = "";
  var _loginPassword = "";
  var mycount = "Select time ";
  var mydetination = "Select destination ";
  var mydeparture = "Select departure ";
  var mydate = "Select date ";

  var countryValue;
  var stateValue;
  var cityValue;

  int date4;
  var date5;
  var date6;

  var date2;
  var date3;
  var mydob;
  int dpval = 1;
  var destval = 1;
  var mygend;

  var dbval1 = 1;
  var myloc = "";

  @override
  void initState() {
    mycount = "Select time";
    mydob = "Choose Date of Departure";
    mydate = "Choose Date of Departure";
    mydetination = "Select destination ";
   mydeparture = "Select departure ";
    mygend = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    var box = Hive.box("booking");

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            
          
            
           Container(

            
           ),
            

            Container(
              // color: Colors.orange,
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Card(
                elevation:2,
                // color: Colors.orange,
                child: Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  padding: EdgeInsets.only(left: 10),
                  child: DropdownButton(
                    value: dpval,
                   
                    isExpanded: true,
                    items: [
                      
                      DropdownMenuItem(
                        child: Text("Select departure"),
                        value: 1,
                        
                      ),
                      DropdownMenuItem(
                        child: Text("Accra"),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Text("Kumasi"),
                        value: 3,
                      ),
                      DropdownMenuItem(
                        child: Text("Takoradi"),
                        value: 4,
                      ),

                      DropdownMenuItem(
                        child: Text("Cape Coast"),
                        value: 5,
                      ),
                      DropdownMenuItem(
                        child: Text("Sunyani"),
                        value: 6,
                      ),

                      DropdownMenuItem(
                        child: Text("Tamale"),
                        value: 7,
                      ),
                      DropdownMenuItem(
                        child: Text("Wa"),
                        value: 8,
                      ),
                      DropdownMenuItem(
                        child: Text("Ho"),
                        value: 9,
                      ),
                      DropdownMenuItem(
                        child: Text("Bolgatanga"),
                        value: 10,
                      ),
                    ],
                    onChanged: (int val) {
                      setState(() {
                        dpval = val;
                      });

                      if (val == 1) {
                        setState(() {
                          mydeparture = "Accra ";
                        });
                      } else if (val == 2) {
                        setState(() {
                          mydeparture = "Kumasi";
                        });
                      } else if (val == 3) {
                        setState(() {
                          mydeparture = "Takoradi";
                        });
                      } else if (val == 4) {
                        setState(() {
                          mydeparture = "cape coast";
                        });
                      }

                       else if (val == 5) {
                        setState(() {
                          mydeparture = "Sunyani";
                        });
                      }

                       else if (val == 6) {
                        setState(() {
                          mydeparture = "Tamale";
                        });
                      }

                       else if (val == 7) {
                        setState(() {
                          mydeparture = "wa";
                        });
                      }

                       else if (val == 8) {
                        setState(() {
                          mydeparture = "Ho";
                        });
                      }

                       else if (val == 9) {
                        setState(() {
                          mydeparture = "bolgatanga";
                        });
                      }
                    },
                    hint: Text("Select Gender"),
                  ),
                ),
              ),
            ),
            

            

            SizedBox(height: 25),
            Container(
              // color: Colors.orange,
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Card(
                elevation:2,
                // color: Colors.orange,
                child: Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  padding: EdgeInsets.only(left: 10),
                  child: DropdownButton(
                    value: destval,
                   
                    isExpanded: true,
                    items: [
                      
                      DropdownMenuItem(
                        child: Text("Select Destination"),
                        value: 1,
                        
                      ),
                      DropdownMenuItem(
                        child: Text("Accra"),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Text("Kumasi"),
                        value: 3,
                      ),
                      DropdownMenuItem(
                        child: Text("Takoradi"),
                        value: 4,
                      ),

                      DropdownMenuItem(
                        child: Text("Cape Coast"),
                        value: 5,
                      ),
                      DropdownMenuItem(
                        child: Text("Sunyani"),
                        value: 6,
                      ),

                      DropdownMenuItem(
                        child: Text("Tamale"),
                        value: 7,
                      ),
                      DropdownMenuItem(
                        child: Text("Wa"),
                        value: 8,
                      ),
                      DropdownMenuItem(
                        child: Text("Ho"),
                        value: 9,
                      ),
                      DropdownMenuItem(
                        child: Text("Bolgatanga"),
                        value: 10,
                      ),
                    ],
                    onChanged: (int val) {
                      setState(() {
                        destval = val;
                      });

                      if (val == 1) {
                        setState(() {
                          mydetination = "Accra ";
                        });
                      } else if (val == 2) {
                        setState(() {
                          mydetination = "Kumasi";
                        });
                      } else if (val == 3) {
                        setState(() {
                          mydetination = "Takoradi";
                        });
                      } else if (val == 4) {
                        setState(() {
                          mydetination = "cape coast";
                        });
                      }

                       else if (val == 5) {
                        setState(() {
                          mydetination = "Sunyani";
                        });
                      }

                       else if (val == 6) {
                        setState(() {
                          mydetination = "Tamale";
                        });
                      }

                       else if (val == 7) {
                        setState(() {
                          mydetination = "wa";
                        });
                      }

                       else if (val == 8) {
                        setState(() {
                          mydetination = "Ho";
                        });
                      }

                       else if (val == 9) {
                        setState(() {
                          mydetination = "bolgatanga";
                        });
                      }
                    },
                    hint: Text("Select Destination"),
                  ),
                ),
              ),
            ),



            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 18, right: 18),
              child: FlatButton(
                  // padding: EdgeInsets.only(le),

                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(DateTime.now().year - 100, 12, 20,
                            DateTime.now().month, DateTime.now().day),
                        maxTime: DateTime(DateTime.now().year + 20, 12, 20),
                        theme: DatePickerTheme(
                            cancelStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                            headerColor: Theme.of(context).accentColor,
                            backgroundColor: Colors.grey[200],
                            itemStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                            doneStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
                        onChanged: (date) {
                      print('change $date in time zone ' +
                          date.timeZoneOffset.inHours.toString());
                      // Text("You have scheduled a meeting on $date");
                    }, onConfirm: (date) {
                      print('confirm $date');
                      setState(() {
                       
                        var date5 = date;

                        var format = DateFormat.yMMMMEEEEd().format(date5);

                        date2 = format.toString();
                        mydob = date2;
                        
                      });
                      
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  child: Text(
                    mydob,
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            SizedBox(height: 15),
            

            
            SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                if (_name.text == "" ||
                    _email.text == "" ||
                    mydob == "Date of Birth" ||
                    _contact.text == "" ||
                    mygend == "" ||
                    
                    myloc == "") {
                  SweetAlert.show(context,
                      title: "Warning",
                      subtitle: "All field must be field",
                      style: SweetAlertStyle.error,
                      showCancelButton: false);
                } else {
                  var uname = box.put("uname", _name.text);
                  var uemail = box.put("uemail", _email.text);
                  var udob = box.put("udob", mydob);
                  var ucontact = box.put("ucontact", _contact.text);
                  var ugender = box.put("ugender", mygend);
                  // var ucountry = box.put("ucountry", mycount);
                  var ustate = box.put("ustate", myloc);

                  Route route =
                      MaterialPageRoute(builder: (c) =>SignUpPage2());
                  Navigator.push(context, route);
                }
              },
              child: Container(
                  //padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(10),
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "Next",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  )),
            )
          ],
        ),
      ),
    ));
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final IconData data;
  final String hintText;
  bool isObsecure = true;

  CustomTextField(
      {Key key, this.controller, this.data, this.hintText, this.isObsecure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        //color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        obscureText: isObsecure,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
            //border: InputBorder.none,

            focusColor: Theme.of(context).primaryColor,
            hintText: hintText ?? "input",
            prefixIcon: Icon(data, color: Theme.of(context).primaryColor)),
      ),
    );
  }
}



class CustomTextFieldNumber extends StatelessWidget {
  final TextEditingController controller;
  final IconData data;
  final String hintText;
  bool isObsecure = true;

  CustomTextFieldNumber(
      {Key key, this.controller, this.data, this.hintText, this.isObsecure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        //color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        obscureText: isObsecure,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
            //border: InputBorder.none,

            focusColor: Theme.of(context).primaryColor,
            hintText: hintText ?? "input",
            prefixIcon: Icon(data, color: Theme.of(context).primaryColor)),
      ),
    );
  }
}




class CustomTextFieldDiv extends StatelessWidget {
  final TextEditingController controller;
  final IconData data;
  final String hintText;
  bool isObsecure = true;

  CustomTextFieldDiv(
      {Key key, this.controller, this.data, this.hintText, this.isObsecure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    return Container(
      height: 50,
      width: screenwidth / 2 - 20,
      decoration: BoxDecoration(
        //color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        obscureText: isObsecure,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
            //border: InputBorder.none,

            focusColor: Theme.of(context).primaryColor,
            hintText: hintText ?? "input",
            prefixIcon: Icon(data, color: Theme.of(context).primaryColor)),
      ),
    );
  }
}

class CustomPasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final IconData data;
  final String hintText;
  final bool isObsecure;

  CustomPasswordTextField(
      {Key key, this.controller, this.data, this.hintText, this.isObsecure})
      : super(key: key);

  @override
  _CustomPasswordTextFieldState createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool _isVisible = true;

  void _visible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        //color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(10),
      child: TextFormField(
        controller: widget.controller,
        obscureText: _isVisible,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
            //border: InputBorder.none,
            focusColor: Theme.of(context).primaryColor,
            hintText: widget.hintText ?? "input",
            suffixIcon: IconButton(
                icon: _isVisible
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
                onPressed: () {
                  setState(() {
                    print(_isVisible);

                    _visible();
                    print("done");
                    print(_isVisible);
                  });
                }),
            prefixIcon:
                Icon(widget.data, color: Theme.of(context).primaryColor)),
      ),
    );
  }
}
