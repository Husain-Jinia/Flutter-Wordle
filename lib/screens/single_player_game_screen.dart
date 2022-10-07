import 'package:flutter/material.dart';

class SinglePlayer extends StatefulWidget {
  const SinglePlayer({Key? key}) : super(key: key);

  @override
  State<SinglePlayer> createState() => _SinglePlayerState();
}

class _SinglePlayerState extends State<SinglePlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Single player"),
      ),
      body: Container(
        child: Center(
          child: Text("screen yay"),
        ),
      ),
      
    );
  }
}