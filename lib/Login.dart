
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'bottom_navi_controller.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController temail = TextEditingController();
  TextEditingController tpassword = TextEditingController();

  String email = "sagar123";
  String pass =  "123456";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  Scaffold(
        body: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.blue.shade400,
                      Colors.blueGrey.shade100,
                      Colors.blue
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    transform: GradientRotation(20))),
            child:Column(
              children: [
                Container(
                    height:60,width:180,
                    margin:EdgeInsets.only(top:110,bottom:50),alignment:Alignment.center,
                    decoration:BoxDecoration(color:Colors.blueGrey.shade200,borderRadius:BorderRadius.circular(100),
                        boxShadow:[
                          BoxShadow(color:Colors.blueGrey,spreadRadius:-3,blurRadius:8,offset:Offset(0,8))
                        ]
                    ),
                    child:Text("Welcome",style:TextStyle(fontSize:40,color:Colors.black,fontFamily:"font1"))
                ),
                Container(
                  height:35,width:150,
                  alignment:Alignment.center,
                  decoration:BoxDecoration(color:Colors.black45,
                    borderRadius:BorderRadius.vertical(bottom:Radius.elliptical(50,5),top:Radius.elliptical(50,5)),
                  ),
                  child:Text("User Login",style:TextStyle(fontSize:22,color:Colors.white,fontFamily: "font2")),
                ),
                Expanded(
                    child: Container(
                      height: size.height,
                      width: size.width,
                      margin: EdgeInsets.only(top:3),
                      decoration: BoxDecoration( color: Colors.black45,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(40),
                              topLeft: Radius.circular(40))),
                      child: ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 90, right: 20, left: 20),
                            child: TextField(
                              autofillHints: [AutofillHints.email],
                              keyboardType: TextInputType.emailAddress,
                              enableSuggestions: true,
                              textInputAction: TextInputAction.next,
                              controller: temail,style:TextStyle(color:Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.blue.shade200),
                                      borderRadius: BorderRadius.circular(30)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  prefixIcon: Icon(
                                    Icons.mail_lock_outlined,
                                    color: Colors.blue.shade200,
                                  ),
                                  hintText: "Enter Your Email",
                                  hintStyle: TextStyle(color: Colors.white70),
                                  labelText: "Email",
                                  labelStyle: TextStyle(color: Colors.blue.shade200)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right: 20, left: 20, top: 20, bottom: 30),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: tpassword,style:TextStyle(color:Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(30)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  prefixIcon:
                                  Icon(Icons.lock, color: Colors.blue.shade200),
                                  hintText: "Enter Your Password",
                                  hintStyle: TextStyle(color: Colors.white70),
                                  labelText: "Password",
                                  labelStyle: TextStyle(color: Colors.white70)),
                            ),
                          ),
                          Column(
                            children: [
                              InkWell(
                                onTap: ()  {
                                  String semail= temail.text;
                                  String spassword= tpassword.text;

                                  if(semail == email && spassword == pass)
                                    {
                                      setState(() {
                                        temail.text = "";
                                        tpassword.text ="";
                                      });
                                      Fluttertoast.showToast(
                                          msg: "Login Successful..",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.green,
                                          textColor: Colors.white,
                                          fontSize: 16.0
                                      );
                                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                                        return bottom_navi_controller();
                                      },));
                                    }
                                  else if(semail == "" && spassword == "")
                                  {
                                    Fluttertoast.showToast(
                                        msg: "Please Fill Details first..!?",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.white,
                                        textColor: Colors.red,
                                        fontSize: 16.0
                                    );
                                  }
                                  else
                                  {
                                    Fluttertoast.showToast(
                                        msg: "Please Try Again.!?",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.white,
                                        textColor: Colors.red,
                                        fontSize: 16.0
                                    );
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  width: size.width-40,
                                  margin: EdgeInsets.only(bottom:50),
                                  decoration: BoxDecoration(
                                      color: Colors.green.shade400,
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(blurRadius: 8, spreadRadius: -3)
                                      ]),
                                  alignment: Alignment.center,
                                  child: Text("Log In",style:TextStyle(fontSize:25,fontFamily: "font1")),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(context,MaterialPageRoute(builder: (context) {
                                    return bottom_navi_controller();
                                  },));
                                },
                                child:Text("Skip Login",style:TextStyle(fontSize:16,color:Colors.red.shade300)),
                              ),
                              SizedBox(height:20,),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Container(
                                  alignment:Alignment.center,
                                  height:45,width:350,
                                  decoration:BoxDecoration(
                                      border:Border.all(color:Colors.grey),borderRadius:BorderRadius.circular(5)
                                  ),
                                  child:Text("Sign Up",style:TextStyle(color:Colors.white)),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ))
              ],
            )
        )
    );
  }
}
