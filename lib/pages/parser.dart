import 'package:flutter/material.dart';
//import 'package:project/pages/parser.dart';
import'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  // ignore: unused_local_variable
  List _data = await getJson();

  // for(int i = 0; i < _data.length; i++){

  //print(_data[i]['title']);

  // }
  //print(_data);

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("parser Data"),
      ),
      body: ListView.builder(
          itemCount: _data.length,
          padding: const EdgeInsets.all(14.5),

          itemBuilder: (BuildContext  context, int position){
            //final index = position ~/2;
            return Column(
              children: <Widget>[
                Divider(height: 8.5,color: Colors.pink,),
                ListTile(
                  title: Text("${_data[position]['name']}"),
                  subtitle: Text("${_data[position]['address']['street']}") ,
                  leading: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Text("${_data[position]['id']}"),
                  ),

                  onTap:() => showmessgae(context,_data[position]['name']),
                ),

              ],

            );

          }),
    ),
  ));
}

void showmessgae ( BuildContext context , String message) {
  var alert = AlertDialog(
    title: Text('My App'),
    content: Text(message),
    actions: <Widget>[
      FlatButton(
        child: Text('ok'),
        onPressed: () {
          Navigator.pop(context);
        },
      )
    ],

  );
  showDialog(context: context , builder:(context)=> alert);
  //showDialog(context: context , child: alert );
}

Future<List> getJson() async {

  String apiUrl ='https://jsonplaceholder.typicode.com/users';
  http.Response response = await http.get(apiUrl);

  return json.decode(response.body);

}