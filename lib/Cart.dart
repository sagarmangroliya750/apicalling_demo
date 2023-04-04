// ignore_for_file: prefer_const_constructors, camel_case_types, use_key_in_widget_constructors, must_be_immutable, avoid_print, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:getwidget/components/rating/gf_rating.dart';
import 'package:http/http.dart' as http;

class Cart extends StatefulWidget {

  int id;
  Cart(this.id);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  Map? m;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  getData()
  async {
    var url = Uri.https('fakestoreapi.com','products/${widget.id}');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      m = jsonDecode(response.body);
      print("$m");
    }
    else {
      print('Request failed with status: ${response.statusCode}.');
    }
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return  m == null ? Center(child:CircularProgressIndicator(backgroundColor:Colors.red,
        color:Colors.blue)) :
    Scaffold(
      backgroundColor:Colors.blueGrey.shade200,
      appBar:AppBar(
        title:Row(children: [
            SizedBox(width:70),
            Text("Cart ",style:TextStyle(fontFamily:'font2')),
            Icon(Icons.shopping_cart_outlined)
        ]),
        backgroundColor: Colors.blueGrey,
      ),
      body:ListView.builder(
        itemCount:1,
        itemBuilder: (context, index) {
        return SizedBox(
          height:200,
          child: Card(
            elevation:5,shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)),
            margin:EdgeInsets.all(15),
           child:Row(
             children: [
               Image.network("${m!['image']}",height:120,width:100),
               VerticalDivider(
                 color:Colors.blueGrey,indent:17,endIndent:17,thickness:1),
               Expanded(
                 child: Column(
                   mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                   children: [
                     Text("${m!['title']}",style:TextStyle(fontFamily:'font3'),textAlign:TextAlign.center),
                     Text("Price : ${m!['price']}/-",style:TextStyle(fontFamily:'font3')),
                     GFRating(
                       size:19,value: m!['rating']['rate'],
                       onChanged: (value) {
                         setState(() {});
                       },),
                     InkWell(
                       onTap:() {},
                       child: Container(
                         height:35,width:140,alignment:Alignment.center,
                           decoration:BoxDecoration(color:Colors.red.shade200,borderRadius:BorderRadius.circular(7),
                               boxShadow:[
                                 BoxShadow(color:Colors.black54,spreadRadius:-1,blurRadius:4)
                               ]
                           ),
                           child:Text("Remove From Cart",style:TextStyle(fontSize:15,fontFamily:'font3',fontWeight:FontWeight.bold),)),
                     )
                   ],
                 ),
               ),
             ],
           ),
          ),
        );
      },)
    );
  }
}
