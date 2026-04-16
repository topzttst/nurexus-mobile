import 'package:flutter/material.dart';

void main() => runApp(NurexusApp());

class NurexusApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Nurexus Connection')),
        body: Center(child: Text('Welcome to the Nexus Hub')),
      ),
    );
  }
}
