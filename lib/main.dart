import 'package:flutter/material.dart';
import 'package:project/database/datahelper.dart';
//import 'package:path_provider/path_provider.dart';
import 'package:project/database/user.dart';
//import 'package:sqflite/sqflite.dart';
//import 'package:async/async.dart';

List _users;
void main () async{
  var db = Databasehelper();

  //int saveduser=await db.saveUser(User("ajeet","peehu"));
  //print("user saved $saveduser");


  _users = await db.getAllUsers();
  for(int i =0; i<_users.length; i++){

   // User user = User.map(_users[i]);
  }

   runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Database App ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('database CRUD'),
      ),
      body: ListView.builder(
        itemCount: _users.length,
          itemBuilder: (_,int position){

          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              title: Text("user: ${User.fromMap(_users[position]).name}"),
              subtitle: Text("id: ${User.fromMap(_users[position]).id}"),

              onTap: ()=> debugPrint("${User.fromMap(_users[position]).id}"),
            ),

          );

          }
      ),
    );
  }
}
