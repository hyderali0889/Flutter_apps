import 'package:flutter/material.dart';
import './widgets/detContent.dart';

class Det extends StatefulWidget {

  final Future<dynamic> data;
  const Det({Key? key , required this.data}) : super(key: key);

  @override
  State<Det> createState() => _DetState();
}

class _DetState extends State<Det> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/details.jpg"),
                fit: BoxFit.cover)),
        child: FutureBuilder(
            future:widget.data ,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return  DetContent(data:snapshot);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
