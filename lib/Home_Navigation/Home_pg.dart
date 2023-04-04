// ignore_for_file: camel_case_types, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, invalid_use_of_protected_member, avoid_print
import 'dart:convert';
import 'package:apicalling_demo/Login%20&%20Register/login_pg.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../Product_details.dart';
import '../Cart.dart';

class Home_pg extends StatefulWidget {
  const Home_pg({Key? key}) : super(key: key);

  @override
  State<Home_pg> createState() => _Home_pgState();
}

class _Home_pgState extends State<Home_pg> {

  List list = [];
  Map? m;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData()
  async {
    var url = Uri.https('fakestoreapi.com','products');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if(response.statusCode == 200)
      {
        list = jsonDecode(response.body);
        print("$list");
      }
    else{
      Center(child:CircularProgressIndicator());
      print('Request failed with status: ${response.statusCode}.');
    }
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return
      WillPopScope(child:SafeArea(
        child: Scaffold(
          backgroundColor:Colors.blueGrey.shade200,
          body: list.isEmpty ? Center(
              child: CircularProgressIndicator(backgroundColor:Colors.red,color:Colors.blue)) :
          Column(
            children: [
              Container(
                height:250,margin:EdgeInsets.all(15),
                decoration:BoxDecoration(
                    boxShadow: [ BoxShadow(color:Colors.black12,spreadRadius:3,blurRadius:5)],
                    color:Colors.white,borderRadius:BorderRadius.circular(30),
                    image:DecorationImage(image:NetworkImage("https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg"))
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height:45,width:45,
                          margin:EdgeInsets.only(left:10,top:10),
                          child: FloatingActionButton(
                            backgroundColor:Colors.red.shade300,
                            onPressed: () {
                              showDialog(
                                barrierDismissible:false,
                                barrierColor:Colors.black54,
                                context: context, builder: (context) {
                                return AlertDialog(
                                  title:Text("Log Out",style:TextStyle(color:Colors.red),),
                                  content:Text("Are you sure want to Logout ?"),
                                  actions: [
                                    TextButton(onPressed: () {
                                      Navigator.pop(context);
                                    },child:Text("No",style:TextStyle(color:Colors.red),)),
                                    TextButton(onPressed: () {
                                      Fluttertoast.showToast(
                                          msg: "Logged Out..",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0
                                      );
                                      Navigator.push(context,MaterialPageRoute(builder: (context) {
                                        return login_pg();
                                      },));
                                    },child:Text("Yes Sure",style:TextStyle(color:Colors.green),)),
                                  ],
                                );
                              },);
                            },
                            child:Icon(Icons.logout_rounded),),
                        ),
                        // Container(
                        //   height:45,width:45,
                        //   margin:EdgeInsets.only(right:10,top:10),
                        //   child: FloatingActionButton(onPressed: () {
                        //     Navigator.push(context,MaterialPageRoute(builder:(context) {
                        //       return Cart(m!['id'.length]);
                        //     },));
                        //   },child:Icon(Icons.shopping_cart)),
                        // ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              margin:EdgeInsets.only(top:100,left:10),
                              child:Text(" The Most \n Unique Designs",style:TextStyle(fontSize:22,fontFamily:"font2")),
                            ),
                            Container(
                              margin:EdgeInsets.only(right:40,top:10),
                              child:Text("For Daily Uses",style:TextStyle(fontSize:20,fontFamily:"font1"),),
                            ),
                          ],
                        ),
                        Container(
                          height:50,width:110,
                          margin:EdgeInsets.only(top:130,right:10),
                          child: ElevatedButton(
                              style:ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.black87),
                                  elevation: MaterialStateProperty.all(10),shape:MaterialStateProperty.all(RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)))
                              ),
                              onPressed: () => "", child:Text("Explore",style:TextStyle(fontSize:16,letterSpacing:1.5))),
                        )
                      ],)
                  ],
                ),
              ),
              SizedBox(
                width:320,height:40,
                child: Text("New Arrivals",style:TextStyle(fontSize:20,letterSpacing:1.5)),
              ),
              Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,childAspectRatio:0.70),
                      itemBuilder: (context, index) {
                        Map m = list[index];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.push(context,MaterialPageRoute(builder: (context) {
                                    return Product_details(m['id']);
                                  },));
                                },
                                child: Container(
                                  margin:EdgeInsets.all(15),
                                  decoration: BoxDecoration(color:Colors.white,boxShadow: [
                                    BoxShadow(color:Colors.black38,blurRadius:7,spreadRadius:-1)
                                  ],borderRadius:BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: NetworkImage("${m['image']}"),
                                    ),
                                  ),
                                  child:Container(
                                    margin:EdgeInsets.only(left:100,top:110,right:10),
                                    child: FloatingActionButton(
                                      backgroundColor: Colors.black,
                                      child:Icon(Icons.add),
                                      onPressed: () {
                                        Navigator.push(context,MaterialPageRoute(builder: (context) {
                                          return Cart(m['id']);
                                        },));
                                      },
                                    ),
                                  ),
                                )
                            ),
                            Expanded(
                              flex:3,
                              child: Container(
                                  width:140,child:Text("${m['title']}",style:TextStyle(fontSize:14,fontFamily:'font3',
                                  color:Colors.indigo))),
                            ),
                            Expanded(
                              flex:1,
                              child: Container(
                                width:140,
                                child: Text("${m['price']} /-",style:TextStyle(letterSpacing:1.5),),
                              ),
                            )
                          ],
                        );
                      },itemCount:list.length)
              )
            ],
          ),
        )), onWillPop: () => _onBackButtonPressed(context));
  }
  Future<bool> _onBackButtonPressed(BuildContext context) async {
    bool exitApp = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const Text(
            ("Are you sure you want to exit App?"),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text("No",style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text("Yes",style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
    return exitApp ? true : false;
  }

}