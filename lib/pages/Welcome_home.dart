import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Homepage();
  }
}

class Homepage extends State<MyHomePage> {

  final TextEditingController _username =  TextEditingController();

  final TextEditingController _password =  TextEditingController();

  String _welcome ="";

  void _clear(){
    setState(() {
   _password.clear();
   _username.clear();
   });
  }

  void _submit(){
    setState(() {
      if(_username.text.isNotEmpty && _password.text.isNotEmpty){
        _welcome = _username.text;
      } else{
        _welcome = "Welcome";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login App"),
        leading: Icon(Icons.menu),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => debugPrint("Search"),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: <Widget>[
              TextField(
                controller: _username,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 13.0, bottom: 13.0),
                child: TextField(
                  controller: _password,
                  decoration: InputDecoration(
                    labelText: 'password',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: Row(
                    children: <Widget>[
                      RaisedButton(
                        child: Text('SUBMIT'),
                        onPressed: _submit,
                      ),
                      Spacer(flex: 1),
                      RaisedButton(
                        child: Text('Clear'),
                        onPressed: _clear,
                      ),
                    ],
                  ),
                ),
              ),
             Expanded(
               child: Text('Welocme user to here .$_welcome',style: TextStyle(
                 fontSize: 30.0,
               ),) ,
             ) ,
            ],
          ),
        ),
      ),
    );
  }
}
