import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget bodegaCard() => Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          InkWell(
            child: Container(
              child: Image.asset(
                "assets/images/bodega.jpg",
                height: 500,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "Bodegas",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );

Widget oficinaCard() => Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          InkWell(
            child: Container(
              child: Image.asset(
                "assets/images/oficina.jpg",
                height: 500,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "Oficinas",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
Widget localCard() => Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          InkWell(
            child: Image.asset(
              "assets/images/local.jpg",
              height: 500,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          const Text(
            "Locales",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
Widget loteCard() => Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          InkWell(
            child: Container(
              child: Image.asset(
                "assets/images/lote.jpg",
                height: 500,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          const Text(
            "Lotes",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
Widget contactoCard() => Card(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          InkWell(
            child: Image.asset(
              "assets/images/contacto.png",
              height: 500,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          const Text(
            "Contacto",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
Widget serviciosCard() => Card(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          InkWell(
            child: Container(
              child: Image.asset(
                "assets/images/nosotros.png",
                height: 500,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          const Text(
            "Servicios",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );

Widget buildColoredCard() => Card(
      shadowColor: Colors.blueGrey,
      elevation: 8,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.black, Colors.blueGrey],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Rounded Card",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "Carta redonda",
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
