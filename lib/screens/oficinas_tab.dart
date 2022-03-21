import 'package:app_web/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OficinasTab extends StatefulWidget {
  const OficinasTab({Key? key}) : super(key: key);

  @override
  State<OficinasTab> createState() => _OficinasTabState();
}

class _OficinasTabState extends State<OficinasTab> {
  List<User> _users = [
    User("Bogotá/Montevideo", "https://www.instagram.com/p/CYMkmjuvtuR/",
        "assets/images/bodega.jpg", false),
    User("Bogotá/Montevideo", "https://www.instagram.com/p/CLnXuw7Hm8K/",
        "assets/images/bodega.jpg", false),
    User("Bogotá/Montevideo", "link instagram", "assets/images/bodega.jpg",
        false),
    User("Bogotá/Montevideo", "link instagram", "assets/images/bodega.jpg",
        false),
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
                    contentPadding: const EdgeInsets.all(0),
                    prefixIcon: const Icon(
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
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    itemCount: _foundedUsers.length,
                    itemBuilder: (context, index) {
                      return userComponent(user: _foundedUsers[index]);
                    })
                : Center(
                    child: Text(
                    "No hay predios por el momento",
                    style: TextStyle(color: Colors.white),
                  )),
          ),
        ));
  }

  userComponent({required User user}) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                  ElevatedButton(
                    onPressed: () {
                      final data = ClipboardData(text: user.userName);
                      Clipboard.setData(data);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    child: const Text(
                      "Copiar Url",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
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
              duration: const Duration(microseconds: 300),
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
