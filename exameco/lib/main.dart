import 'dart:convert';

import 'package:exameco/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Myapp(),
  ));
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  bool c =false;
  List list=[];
  gt_cat() async {
    var url = Uri.parse('https://dummyjson.com/products/categories');
    var response = await http.get(url);
     list = jsonDecode(response.body);
      c=true;
      setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gt_cat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("category")),
    body: c==true?ListView.builder(itemCount: list.length,itemBuilder: (context, index) {
      return ListTile(title: Text("${list[index]}"),onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return product(list[index]);
        },));
      },);
    },):Center(child: CircularProgressIndicator(),)
    );
  }}