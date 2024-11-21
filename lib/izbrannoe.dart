import 'package:flutter/material.dart';
import 'module/date_base.dart';
import 'yslygi_karta.dart';

List<int> favoriteList = [];

class FavoriteUser extends StatefulWidget {
  const FavoriteUser({super.key});

  @override
  State<FavoriteUser> createState() => _FavoriteUserState();
}

class _FavoriteUserState extends State<FavoriteUser> {
  int id = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color.fromARGB(200, 10, 58, 69),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 11, 58, 71),
        toolbarHeight: 50,
        centerTitle: true,
        title: Text("Избранное",
          style: const TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,
              height: 0,
              decoration: TextDecoration.none),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.white,
            height: 2.5,
          ),
        ),
      ),
      body:
    Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
    SizedBox(
    height: 670,

      child: ListView.builder(
        itemCount: favoriteList.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            onDismissed: (_) {
              setState(() {
                favoriteList.removeAt(index);
              });
            },
            child: GestureDetector(
              onTap: () {
                setState(
                  () {
                    id = favoriteList[index];
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ServiceCard(id: id),
                      ),
                    );
                  },
                );
              },

              child: Card(
                color:  const Color.fromARGB(255, 10, 58, 69),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1),
                  ),
                  child: ListTile(
                    title: Text(
                      yslygi[favoriteList[index]].name,
                      style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'Actay',
                          height: 0,
                          decoration: TextDecoration.none,
                          color: Colors.white),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            favoriteList.removeAt(index);
                          });
                        },
                        icon: const Icon(
                          Icons.heart_broken,
                          color: Colors.white,
                        )),
                    leading: Image.asset(
                        yslygi[favoriteList[index]].yslygiPhoto[0]),
                    subtitle: Text(
                        style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'Actay',
                            height: 0,
                            decoration: TextDecoration.none,
                            color: Colors.white),
                        yslygi[favoriteList[index]].price.toString()),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    ),
    ]
    ),
    );
  }
}
