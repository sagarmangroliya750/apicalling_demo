// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("Cart"),
        backgroundColor: Colors.orange.shade400,
      ),
    );
  }
}
