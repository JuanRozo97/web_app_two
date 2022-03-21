import 'package:app_web/models/widgets.dart';
import 'package:app_web/screens/bodegas_tab.dart';
import 'package:app_web/screens/contacto_tab.dart';
import 'package:app_web/screens/locales_tab.dart';
import 'package:app_web/screens/lotes_tab.dart';
import 'package:app_web/screens/oficinas_tab.dart';
import 'package:app_web/screens/servicios_tab.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InicioTab extends StatefulWidget {
  InicioTab({Key? key}) : super(key: key);

  @override
  State<InicioTab> createState() => _InicioTabState();
}

class _InicioTabState extends State<InicioTab> {
  final List<String> titles = [
    "OFICINAS",
    "LOCALES",
    "BODEGAS",
    "LOTES",
    "CONTACTO",
    "SERVICIOS"
  ];

  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600;
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 600;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeigth = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      body: Container(
        margin: const EdgeInsets.only(top: 5, bottom: 8),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "¡Nos complace tenerte aquí!",
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                )
              ],
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "¿Ya conoces nuestros servicios? Somos más que una inmobiliaria.",
                    style: GoogleFonts.inter(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 520, right: 520, bottom: 20),
              child: SizedBox(
                height: 150,
                width: 10,
                child: ElevatedButton(
                  clipBehavior: Clip.antiAlias,
                  style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 14, 73),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(62)),
                      minimumSize: const Size(0.8, 0.8)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OficinasTab()));
                  },
                  child: oficinaCard(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 520, right: 520, bottom: 20),
              child: SizedBox(
                height: 150,
                width: 20,
                child: ElevatedButton(
                  clipBehavior: Clip.antiAlias,
                  style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 14, 73),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(62)),
                      minimumSize: const Size(0.8, 0.8)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LocalesTab()));
                  },
                  child: localCard(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 520, right: 520, bottom: 20),
              child: SizedBox(
                height: 150,
                width: 10,
                child: ElevatedButton(
                  clipBehavior: Clip.antiAlias,
                  style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 14, 73),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(62)),
                      minimumSize: const Size(0.8, 0.8)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BodegasTab()));
                  },
                  child: bodegaCard(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 520, right: 520, bottom: 20),
              child: SizedBox(
                height: 150,
                width: 10,
                child: ElevatedButton(
                  clipBehavior: Clip.antiAlias,
                  style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 14, 73),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(62)),
                      minimumSize: const Size(0.8, 0.8)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LotesTab()));
                  },
                  child: loteCard(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 520, right: 520, bottom: 20),
              child: SizedBox(
                height: 150,
                width: 10,
                child: ElevatedButton(
                  clipBehavior: Clip.antiAlias,
                  style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 14, 73),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(62)),
                      minimumSize: const Size(0.8, 0.8)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ContactoTab()));
                  },
                  child: contactoCard(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 520, right: 520, bottom: 20),
              child: SizedBox(
                height: 150,
                width: 10,
                child: ElevatedButton(
                  clipBehavior: Clip.antiAlias,
                  style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 14, 73),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(62)),
                      minimumSize: const Size(0.8, 0.8)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ServiciosTab()));
                  },
                  child: serviciosCard(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
