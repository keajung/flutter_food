import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {

  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> data = <dynamic>[];
  List<int> colorCodes = <int>[900,800,700,600,500,400,300,200,100];

  dynamic info;
  final List<int> price = <int>[];
  final List<String> image =  <String>[];
  final List<String> name =  <String>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBar(
          title: Text('โบโบ้ GRAB FOOD 🐶'),
        ),
        body: Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: (){
                  setState(() {
                    _handleClickButton();
                  });
                },
                child: const Text('LOAD FOODS DATA'),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: image.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Container(
                      height: 50,
                      color: Colors.white,
                      child: Row(
                        children: [
                          Image.network('${image[index]}',
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Column(

                              children: [
                                Text(name[index] , style: TextStyle(fontWeight: FontWeight.bold,  fontSize: 15)),
                                Text('${price[index].toString()} บาท' , style: TextStyle(fontSize: 13)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        )
    );
  }
  _handleClickButton() async {
    final url = Uri.parse('https://cpsu-test-api.herokuapp.com/foods');
    var result = await http.get(url);
    var json = jsonDecode(result.body);

    //เคลียร์เฉยๆ เดี๋ยวกดปุ่มหลายครั้งข้อมูลเพิ่มเรื่อยๆ
    image.clear();
    name.clear();
    price.clear();

    data = json['data'];
    for(int i=0;i<data.length;++i){
      info = data[i];
      image.add(info['image']);
      name.add(info['name']);
      price.add(info['price']);
    }

  }
}

