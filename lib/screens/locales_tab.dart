import 'package:app_web/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class LocalesTab extends StatefulWidget {
  LocalesTab({Key? key}) : super(key: key);

  @override
  State<LocalesTab> createState() => _LocalesTabState();
}

class _LocalesTabState extends State<LocalesTab> {
  List<User> _users = [
    User(
        "Bogotá/Montevideo \n 10.000mts",
        "https://www.instagram.com/p/CYMkmjuvtuR/",
        "assets/images/bodega.jpg",
        false),
    User(
        "Bogotá/Montevideo \n 20.000 metros",
        "https://www.instagram.com/p/CLnXuw7Hm8K/",
        "assets/images/bodega.jpg",
        false),
    User("Bogotá/Montevideo", "link instagram", "assets/images/bodega.jpg",
        false),
    User(
      "Bogotá/Montevideo",
      "link instagram",
      "assets/images/bodega.jpg",
      false,
    ),
    User("Bogotá/Río Negro", "link instagram", "assets/images/bodega.jpg",
        false),
    User("Siberia", "link instagram", "assets/images/bodega.jpg", false),
    User("Funza", "link instagram", "assets/images/bodega.jpg", false),
  ];
  List<User> _foundedUsers = [];
  onSearch(String search) {
    setState(() {
      _foundedUsers = _users
          .where((user) => user.name.toLowerCase().contains(search))
          .toList();
    });
  }

  launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "No se pudo abrir $url";
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _foundedUsers = _users;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeigth = MediaQuery.of(context).size.height;

    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.black,
            title: Container(
              height: 38,
              child: TextField(
                onChanged: (value) => onSearch(value),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(0),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none),
                    hintStyle:
                        const TextStyle(fontSize: 14, color: Colors.black),
                    hintText: "Busca el predio de tú interés"),
              ),
            ),
          ),
          body: Container(
            color: Colors.black,
            child: _foundedUsers.length > 0
                ? ListView.builder(
                    padding: EdgeInsets.only(right: 20, left: 20),
                    itemCount: _foundedUsers.length,
                    itemBuilder: (context, index) {
                      return userComponent(user: _foundedUsers[index]);
                    })
                : const Center(
                    child: Text(
                    "No hay predios por el momento",
                    style: TextStyle(color: Colors.white),
                  )),
          ),
        ));
  }

  userComponent({required User user}) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(user.image),
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    user.userName,
                    style: const TextStyle(color: Colors.white),
                  ),
                  Center(
                    child: Link(
                        target: LinkTarget.blank,
                        uri: Uri.parse(user.userName),
                        builder: (context, followLink) => ElevatedButton(
                            onPressed: followLink,
                            child: Text("Ver imágenes"))),
                  )
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                user.isSelled = !user.isSelled;
              });
            },
            child: AnimatedContainer(
              height: 35,
              width: 110,
              duration: Duration(microseconds: 300),
              decoration: BoxDecoration(
                color: user.isSelled ? Colors.lightBlue : Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                    color: user.isSelled ? Colors.transparent : Colors.black),
              ),
              child: Center(
                child: Text(
                  user.isSelled ? "Arriendo" : "Venta",
                  style: TextStyle(
                      color: user.isSelled ? Colors.white : Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
