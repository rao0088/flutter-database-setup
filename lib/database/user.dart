//import 'dart:core';
class User {
  String _name;
  String _pass;
  int _id;
 User(this._name,this._pass,);

 User.map(dynamic obj){
   this._name = obj['name'];
   this._pass = obj['pass'];
   this._id = obj['id'];

 }
 String get name =>_name;
 String get pass =>_pass;
 int get id => _id;

 Map<String,dynamic> toMap(){

   var map = Map<String,dynamic>();
   map['name']=_name;
   map['pass']=_pass;
   if(id != null) {
     map['id'] = _id;
   }
   return map;

 }
User.fromMap(Map<String,dynamic>map){

   this._name=map['name'];
   this._pass=map['pass'];
   this._id=map['id'];

}

}