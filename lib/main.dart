import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Starttt(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Starttt extends StatefulWidget {

  @override
  _StartttState createState() => _StartttState();
}

class _StartttState extends State<Starttt> {
  int _count = 1;

  void initState() {
    super.initState();
    getIntFromLocalMemory('COUNTER_NUMBER').then((value) =>
    _count = value
    );
  }







  void _incrementCounter() {
    setState(() {
      _count++;
    });
    saveIntInLocalMemory('COUNTER_NUMBER', _count);

    if (_count == 10)
      setState(() {
        _count = 0;
      });
    saveIntInLocalMemory('COUNTER_NUMBER', _count);
  }

  Future<void> _doall() async {


  }






  @override
  Widget build(BuildContext context) {

    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: new BoxDecoration(
                gradient: new LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, Colors.grey],
                )),
          ),
          Stack(
            children: [
              Transform.rotate(
                angle: 6,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){_incrementCounter();},
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 90),
                        width: 650,
                        height: 550,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){_doall();},
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 90),
                        width: 650,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.fromLTRB(1050, 700, 0, 0),
                width: 400,
                height: 400,
                child:  Text(
                    "$_count"
                ) ,
              )

            ],
          )
        ],
      ),
    );
  }
}

/*
  * It saves the int value to the local memory.
  * */
Future<int> getIntFromLocalMemory(String key) async {
  var pref = await SharedPreferences.getInstance();
  var number = pref.getInt(key) ?? 0;
  return number;
}

/*
  * It returns the saved the int value from the memory.
  * */
Future<void> saveIntInLocalMemory(String key, int value) async {
  var pref = await SharedPreferences.getInstance();
  pref.setInt(key, value);
}