import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Planetx();
  }

}

class Planetx extends State<MyHomePage>{

  TextEditingController _weightpound = TextEditingController();
  double _result = 0.0;
   int radiovalue =0;
   String _results="";

   void radiobuttionclick(int value){

     setState(() {
       radiovalue=value;
       switch(radiovalue){

         case 0:
           _result=calculatew(_weightpound.text,0.06);

           _results = "this is for moon ${_result.toStringAsFixed(1)}";


           break;

         case 1:
           _result=calculatew(_weightpound.text,0.38);
           _results = "this is for mars ${_result.toStringAsFixed(1)}";

           break;

         case 2:
           _result=calculatew(_weightpound.text,0.91);
           _results = "this is for venus ${_result.toStringAsFixed(1)}";



       }
     });

   }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Planet Weight',textAlign: TextAlign.center,),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Text("Welcome to planet weight System",style: TextStyle(
              fontSize: 20.0,
            ),),
          ),
          TextField(
            controller: _weightpound,
            decoration:InputDecoration(labelText: 'Weight',
              helperText: 'in pounds',
              icon: Icon(Icons.watch_later),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Radio<int>(
                    activeColor: Colors.amber,
                  value: 0, groupValue: radiovalue, onChanged: radiobuttionclick,),
                Text("moon"),
                Radio<int>(
                 activeColor: Colors.redAccent,
                  value: 1, groupValue: radiovalue, onChanged: radiobuttionclick,),
            Text("mars"),
                Radio<int>(
                 activeColor: Colors.green,
                  value: 2, groupValue: radiovalue, onChanged: radiobuttionclick,),
                Text("venus"),

              ],
            ),
          ),
           Padding(
             padding: const EdgeInsets.all(25.0),
             child: Center(
               child: Text(

                 _weightpound.text.isEmpty ? "please enter value" : _results +"lbs",
                 style: TextStyle(
                 fontSize: 15.0,
                 fontWeight: FontWeight.bold,
               ),),
             ),
           )
        ],
      ),
    );
  }

  double calculatew(String weight, double d) {

     if(int.parse(weight).toString().isNotEmpty && int.parse(weight)>0){
       return int.parse(weight)*d;
     }else{
       print('Wrong!');
       return int.parse("180")* 0.38;
     }

  }
}
