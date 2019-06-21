//import 'dart:convert';
import 'package:flutter/material.dart';
//import 'dart:async';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _citys =" delhi";

  Future _getcity(BuildContext context) async{

    Map result = await Navigator.of(context).push(
      MaterialPageRoute<Map>(builder: (BuildContext context){

        return ChangeCity();

      })
    );
    if( result != null && result.containsKey('city')){

      //print(result['city']);
      _citys =result['city'];

    }else{

      _citys ='delhi';
    }

  }
  void showStuff() async {
    Map _data = await getWeather(ustl.appid, ustl.city);

    print(_data.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Wheather app'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {_getcity(context);},
          )
        ],
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              child: Image.asset(
                'images/back.jpg',
                fit: BoxFit.fill,
                height: 730.0,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15.5),
              child: Text(
                '$_citys',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              alignment: Alignment.topRight,
            ),
            Container(
              alignment: Alignment.center,
              child: updateTempwidget(_citys),
            ),
          ],
        ),
      ),
    );
  }

  Future<Map> getWeather(String apiKey, String city) async {
    String apiUrl =
        'http://api.openweathermap.org/data/2.5/weather?q=$city&appid='
        '${ustl.appid}&units=metric';

    http.Response response = await http.get(apiUrl);

    return json.decode(response.body);
  }

  Widget updateTempwidget(String city) {
    return FutureBuilder(
        future: getWeather(ustl.appid, city == null ? ustl.city : city),
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          if (snapshot.hasData) {
            Map datas = snapshot.data;
            return Container(
              // alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ListTile(
                    title: Text(
                      datas['main']['temp'].toString() +"C",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  Text("humidity:${datas['main']['humidity'].toString()}\n"
                      "MIN temp : ${datas['main']['temp_min'].toString()} C\n"
                      "MAx temp : ${datas['main']['temp_max'].toString()} C \n",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),

                ],
              ),
            );
          } else {
            return Container();
          }
        });
  }
}

class ChangeCity extends StatelessWidget {
  final  _cityname = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select city'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('Enter the city name'),
            ),
            TextField(
              controller: _cityname,
              decoration: InputDecoration(
              labelText: 'City Name',
              border: OutlineInputBorder(),
            ),),
            RaisedButton(
              child: Text('Submit'),
              onPressed: () {
                Navigator.pop(context,{
                  'city': _cityname.text
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

