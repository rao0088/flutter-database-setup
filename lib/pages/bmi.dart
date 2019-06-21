import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return Bmipage();
  }

}

class Bmipage extends State<MyHomePage> {
  TextEditingController _age =TextEditingController();
  TextEditingController _height =TextEditingController();
  TextEditingController _weight =TextEditingController();
  double inches = 0.0;

  double result = 0.0;
  String results =" ";
   String _res  =" ";


  void _cal(){
    setState(() {
      int age =int.parse(_age.text);
      double height = double.parse(_height.text);
      inches= height*12;
      double weight = double.parse(_weight.text);

      if((_age.text.isNotEmpty || age >0) && (_height.text.isNotEmpty || inches > 0) &&(_weight.text.isNotEmpty || weight>0)) {

        result = weight / (inches * inches) * 703;

        if(double.parse(result.toStringAsFixed(1)) < 18.5){
          results = "under weight";

        } else if( double.parse(result.toStringAsFixed(1)) >= 18.5 && result < 25) {
          results = " Great shape";
          print(result);
        }else if(double.parse(result.toStringAsFixed(1)) >=25 && result < 30 ){
          results ="Overweight";
          print(result);

        }else if( double.parse(result.toStringAsFixed(1)) > 30) {
          results = "Obese";
          print(result);
        }

        }else{

        result = 0.0;
      }

    });

    _res ="your bmi:${result.toStringAsFixed(1)}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CalCulator'
      ),),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: Text("BODY MASS CALCULATOR" ,
                textAlign: TextAlign.center,
                style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w800,
                color: Theme.of(context).textSelectionColor,
              ),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _age,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Age',
                    icon: Icon(Icons.supervisor_account),
                  ),
                ),

                TextField(
                  controller: _height,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Height',
                    icon: Icon(Icons.wc),
                  ),
                ),

                TextField(
                  controller: _weight,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Weight',
                    icon: Icon(Icons.center_focus_weak),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: FlatButton(
                    padding: const EdgeInsets.all(20.0),
                    color:Colors.pink,
                    child: Text("Calculate",style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),),
                    onPressed: _cal,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('$_res', style: TextStyle(
                    fontSize: 20.0,
                  ),),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('$results', style: TextStyle(
                    color: Colors.pink,
                  ),),
                ),

              ],

            ),
          )
        ],
      ),
    );
  }

}