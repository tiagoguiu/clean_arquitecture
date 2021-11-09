import 'package:flutter/material.dart';

class Teste extends StatelessWidget {
  const Teste({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BootCamp'),
      ),
      drawer: Drawer(),
      body: Center(
        child: Text("Este texto está na tela")
      ),
      backgroundColor: Colors.green,
    );
  }
}
