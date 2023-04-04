// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, camel_case_types, invalid_use_of_protected_member, use_key_in_widget_constructors, must_be_immutable, avoid_print, unnecessary_null_comparison

import 'dart:convert';

import 'package:flutter/material.dart';
import '../bottom_navi_controller.dart';
import 'package:http/http.dart'as http;

class Product_details extends StatefulWidget {

  int id;
  Product_details(this.id);

  @override
  State<Product_details> createState() => _Product_detailsState();
}

class _Product_detailsState extends State<Product_details> {

  Map? m;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  getData()
  async {
    var url = Uri.https('fakestoreapi.com', 'products/${widget.id}');
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: m == null ? Center(child:CircularProgressIndicator(backgroundColor:Colors.red,
        color:Colors.blue)) :
      Stack(
        children: [
          Container(
            margin:EdgeInsets.only(top:40,left:15,right:15),
            width:350,
            child:Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height:45,width:45,
                  decoration:BoxDecoration(color:Colors.blueGrey.shade100,
                      borderRadius:BorderRadius.circular(15),
                      boxShadow:[
                        BoxShadow(color:Colors.black26,blurRadius:0.7,spreadRadius:1)
                      ]),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) {
                          return bottom_navi_controller();
                        },));
                      }, icon:Icon(Icons.home_outlined)),
                ),
                Container(
                  height:45,width:220,
                  decoration:BoxDecoration(color:Colors.blueGrey.shade100,
                      borderRadius:BorderRadius.circular(15),
                      boxShadow:[
                        BoxShadow(color:Colors.black26,blurRadius:0.7,spreadRadius:1)
                      ]),
                  child:Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      Container(child:Text("  Details",style:TextStyle(fontSize:20,letterSpacing:1.5))),
                      Container(child:Icon(Icons.more_vert)),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height:270,width:280,
            margin:EdgeInsets.only(top:100,left:45),
            child: Image.network("${m!['image']}",height:230,width:200),
          ),
          Container(
            height:400,width:330,
            margin:EdgeInsets.only(top:375,left:35),
            decoration:BoxDecoration(color:Colors.blueGrey.shade200,
                borderRadius:BorderRadius.only(topLeft:Radius.circular(40)),
                boxShadow:[
                  BoxShadow(
                      color:Colors.black12,blurRadius:8,spreadRadius:5
                  )
                ]
            ),
            child:Column(children: [
              Container(
                height:70,
                child:Row(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin:EdgeInsets.only(top:20),
                      width:170,
                      child: Text("${m!['title']}",style:TextStyle(fontSize:14,fontFamily:'font2')),
                    ),
                    Column(
                      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Price    ",style:TextStyle(fontSize:15,fontFamily:'font2')),
                        Text("${m!['price']}/-💲",style:TextStyle(fontSize:16,letterSpacing:1.5,color:Colors.black)),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin:EdgeInsets.only(left:60,top:30),
                height:65,width:size.width,
                decoration:BoxDecoration(color:Colors.grey.shade300,
                    borderRadius:BorderRadius.only(topLeft:Radius.circular(40),bottomLeft:Radius.circular(40))),
                child:Row(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin:EdgeInsets.only(left:10,right:20),
                      child:Text("Color",style:TextStyle(fontSize:16,letterSpacing:1.5)),
                    ),
                    CircleAvatar(
                      backgroundColor:Colors.brown.shade200,maxRadius:16,
                    ),
                    CircleAvatar(
                      backgroundColor:Colors.orange.shade300,maxRadius:16,
                    ),
                    CircleAvatar(
                      backgroundColor:Colors.lightGreen,maxRadius:16,
                    ),
                    CircleAvatar(
                      backgroundColor:Colors.grey,maxRadius:16,
                    )
                  ],
                ),
              ),
              Container(
                  margin:EdgeInsets.only(top:30,left:20,right:20),
                  height:100,width:400,
                  child:ListView(children: [
                    Text("${m!['description']}",style:TextStyle(fontSize:15,fontFamily:'font3')),
                  ],)
              ),
              Expanded(
                  child: Container(
                    margin:EdgeInsets.only(left:30,top:20),
                    width:300,
                    alignment: Alignment.center,
                    decoration:BoxDecoration(color:Colors.black87,borderRadius:BorderRadius.only(topLeft:Radius.circular(40))),
                    child:Text("Shop Now",style:TextStyle(color:Colors.white,fontSize:20,letterSpacing:2)),
                  ))
            ],
          ),
          ),
        ],
      )
    );
  }
}
