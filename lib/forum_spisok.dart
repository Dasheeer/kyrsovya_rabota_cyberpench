import 'package:flutter/material.dart';
import 'forum_karta.dart';
import 'module/data2.dart';
import 'module/date_base.dart';

class ForumList extends StatefulWidget {
  const ForumList({super.key});
  @override
  State<ForumList> createState() => _ForumListState();
}

class _ForumListState extends State<ForumList> {
  //Переменные
  final TextEditingController _searchController = TextEditingController();
  int selectIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color.fromARGB(200, 10, 58, 69),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 11, 58, 71),
        toolbarHeight: 50,
        centerTitle: true,
        title: Text("Статьи",
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

      Padding(
        padding: const EdgeInsets.only(top: 5, bottom:0, left:3, right:3),
        child:
        GridView.builder(
          itemCount: yslygi.length,
          itemBuilder: _createListView,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 9,
              crossAxisCount: 1,
              mainAxisSpacing: 7,
              childAspectRatio:5/4),
        ),
      ),



    );
  }

  Widget _createListView(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ForumCard(id: selectIndex),
            ),
          );
          selectIndex = index;
        });
      },




      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFFFFFFF), width: 1.0),
          borderRadius: BorderRadius.circular(12),
          image: const DecorationImage(
            image: AssetImage("lib/assets/image/BACKGROUND/Product.png"),
            fit: BoxFit.cover,
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //ИКОНКА
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

              ],
            ),

            //фото
            Image.asset(catalofFO[index].forumPhoto[0]),


            const SizedBox(
              height: 25,
            ),


            //статья название
            SizedBox(
              height: 80,
              child: Text(
                catalofFO[index].name,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'ActayWide',
                    height: 0,
                    decoration: TextDecoration.none),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(
              height: 16,
            ),

          ],
        ),
        ),
        );
  }
}
