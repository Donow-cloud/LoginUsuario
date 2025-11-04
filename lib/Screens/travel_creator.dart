import 'package:flutter/material.dart';

class TravelCreator extends StatefulWidget {
  const TravelCreator({super.key});

  @override
  State<TravelCreator> createState() => _TravelCreatorState();
}

class _TravelCreatorState extends State<TravelCreator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Home Page', style: TextStyle(fontSize: 40))),
    );
  }
}
