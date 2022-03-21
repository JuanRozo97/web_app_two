import 'package:flutter/material.dart';

class ServiciosTab extends StatefulWidget {
  ServiciosTab({Key? key}) : super(key: key);

  @override
  State<ServiciosTab> createState() => _ServiciosTabState();
}

class _ServiciosTabState extends State<ServiciosTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Servicios"),
      ),
    );
  }
}
