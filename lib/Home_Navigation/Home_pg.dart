// ignore_for_file: camel_case_types, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, invalid_use_of_protected_member
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Login.dart';

class Home_pg extends StatefulWidget {
  const Home_pg({Key? key}) : super(key: key);

  @override
  State<Home_pg> createState() => _Home_pgState();
}

class _Home_pgState extends State<Home_pg> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor:Colors.blueGrey.shade200,
          body:Column(
            children: [
              Container(
                  height:250,margin:EdgeInsets.all(15),
                  decoration:BoxDecoration(
                      boxShadow: [ BoxShadow(color:Colors.black12,spreadRadius:3,blurRadius:5)],
                      color:Colors.white,borderRadius:BorderRadius.circular(30),
                        image:  DecorationImage(
                        image: NetworkImage("imge"),
                        fit: BoxFit.fitHeight, opacity: 0.7)
                  ),
                child: Row(
                  children: [
                    Column(
                    children: [
                      Container(
                          height:45,width:45,
                          margin:EdgeInsets.only(right:110,top:10),
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
                                     return Login();
                                   },));
                                  },child:Text("Yes sure !")),
                                  TextButton(onPressed: () {
                                    Navigator.pop(context);
                                  },child:Text("No"))
                                ],
                              );
                            },);
                          },
                          child:Icon(Icons.logout_rounded),),
                      ),
                      Container(
                        margin:EdgeInsets.only(top:100,left:20),
                        child:Text(" The Most \n Unique Designs",style:TextStyle(fontSize:22,fontFamily:"font2")),
                      ),
                      Container(
                        margin:EdgeInsets.only(right:45,top:10),
                        child:Text("For Daily Uses",style:TextStyle(fontSize:18,fontFamily:"font1"),),
                      )
                    ],
                    ),
                    Container(
                      height:50,width:110,
                      margin:EdgeInsets.only(top:160,left:20),
                      child: ElevatedButton(
                          style:ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.black87),
                          elevation: MaterialStateProperty.all(10),shape:MaterialStateProperty.all(RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)))
                          ),
                          onPressed: () => "", child:Text("Explore")),
                    )
                  ],
                ),
              ),
              SizedBox(
                width:320,height:40,
                child: Text("New Arrivals",style:TextStyle(fontSize:20)),
              ),
              Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio:0.70),
                    itemCount:4,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              // Navigator.push(context,MaterialPageRoute(builder: (context) {
                              //   return Product_details();
                              // },));
                            },
                            child: Container(
                              margin:EdgeInsets.all(15),
                              decoration: BoxDecoration(color:Colors.white,boxShadow: [
                                BoxShadow(color:Colors.black38,blurRadius:7,spreadRadius:-1)
                              ],borderRadius:BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: NetworkImage("image"),
                                ),
                              ),
                              child:Container(
                                margin:EdgeInsets.only(left:100,top:110,right:10),
                                child: FloatingActionButton(
                                  backgroundColor: Colors.black,
                                  child:Icon(Icons.add),
                                  onPressed: () {},
                                ),
                              ),
                            )
                          ),
                          Expanded(
                            flex:2,
                            child: Container(
                                width:140,child:Text("Data",style:TextStyle(fontSize:17,
                            color:Colors.indigo))),
                          ),
                          Expanded(
                            flex:1,
                            child: Container(
                                width:140,
                                child: Text("data"),
                            ),
                          )
                        ],
                      );
                    },)
              )
            ],
          ),
        ));
  }
}
