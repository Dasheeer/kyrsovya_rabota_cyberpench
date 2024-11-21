import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'module/data2.dart';


class ForumCard extends StatefulWidget {
  final int id;
  //MyWidget({this.id});
  const ForumCard({Key? key, required this.id}) : super(key: key);

  @override
  State<ForumCard> createState() => _ForumCardState();
}

class _ForumCardState extends State<ForumCard> {
  int activeIndex = 0;
  bool isTap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 63, 98, 108),
      //Верхняя панель
      appBar: AppBar(

        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 11, 58, 70),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: Text(
                maxLines: 2,
                catalofFO[widget.id].name,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    decoration: TextDecoration.none),
              ),
            )
          ],
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: Colors.white,
              height: 1,
            )),
      ),
      //Список товаров
      body:

      Form(

        child:
        Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/image/BACKGROUND/Product.png"),
                fit: BoxFit.cover,
              ),
            ),
            height: 8000,
            child: SingleChildScrollView(
            child: Center(
            child: Container(
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(31, 84, 96, 1.0),
        border: Border.all(color: Color(0xFFFFFFFF), width: 1.5),
      ),
      width: double.infinity,  // <-- Takes up total width of the device
      height: 900,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),

      child: Card(
        color: const Color.fromARGB(255, 63, 98, 108),
        child: Column(
          children: [
              //ФОТОГРФИИ МАШИНЫ
              Image.asset(catalofFO[widget.id].forumPhoto[0]),

              //ЦЕНА


              //ОТСТУП
              const SizedBox(
                height: 20,
              ),

              //ОПИСАНИЕ

               Text(textAlign: TextAlign.center,
                    catalofFO[widget.id].discription1,
                    style: const TextStyle(fontSize: 19, color: Colors.white, backgroundColor: const Color.fromARGB(
                        255, 11, 58, 69),)),


              const SizedBox(
                height: 10,
              ),
          Center(
            child:
              Text(
                  catalofFO[widget.id].discription2,
                  style: const TextStyle(fontSize: 19, color: Colors.white, backgroundColor: const Color.fromARGB(
                      255, 11, 58, 69),)),
          ),
              const SizedBox(
                height: 10,
              ),

              Text(
                  catalofFO[widget.id].discription3,
                  style: const TextStyle(fontSize: 19, color: Colors.white, backgroundColor: const Color.fromARGB(
                      255, 11, 58, 69),)),

              const SizedBox(
                height: 10,
              ),

              Text(
                  catalofFO[widget.id].discription4,
                  style: const TextStyle(fontSize: 19, color: Colors.white, backgroundColor: const Color.fromARGB(
                      255, 11, 58, 69),)),

              const SizedBox(
                height: 10,
              ),

              Text(
                  catalofFO[widget.id].discription5,
                  style: const TextStyle(fontSize: 19, color: Colors.white, backgroundColor: const Color.fromARGB(
                      255, 11, 58, 69),)),


              //ОТСТУП
              const SizedBox(
                height: 16,
              ),

              //BUTTONS


                  //add to favorite
                ],
              ),

              //ОТСТУП

              //ВИДОСИК

          ),
        ),
    ),
    ),
              ),
      ),
    );
  }
}
