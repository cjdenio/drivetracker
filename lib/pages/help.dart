import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title:Text("Help")),
      body: Center(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Text("Getting Started", style: Theme.of(context).textTheme.headline4),
          Text("Help page!")
        ]
      ))
    );
  }
}