import 'dart:convert';

import 'package:exameco/productdetails.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class product extends StatefulWidget {
  String s;

  product(this.s);

  @override
  State<product> createState() => _productState();
}

class _productState extends State<product> {
  List l = [];

  gt_pro() async {
    var url = Uri.parse('https://dummyjson.com/products/category/${widget.s}');
    var response = await http.get(url);
    Map list = jsonDecode(response.body);
    l = list['products'];
    print(l);
    setState(() {});
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gt_pro();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.s}")),
      body: ListView.builder(
        itemCount: l.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("${l[index]['title']}"),
            subtitle: Text("${l[index]['price']}"),
            leading: Container(height: 70,width: 70,child: Image(image: NetworkImage(l[index]['thumbnail']))),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return prodetails(l[index]);
              },));
            },
          );
        },
      ),
    );
  }
}
