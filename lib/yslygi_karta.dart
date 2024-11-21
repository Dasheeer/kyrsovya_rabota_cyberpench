import 'package:flutter/material.dart';
import 'isrotia_pokypok.dart';
import 'module/date_base.dart';
import 'izbrannoe.dart';
import 'korzina.dart';


class ServiceCard extends StatefulWidget {
  final int id;

  const ServiceCard({Key? key, required this.id}) : super(key: key);

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  int activeIndex = 0;
  bool isTap = false;

  void _showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2), // Длительность отображения SnackBar
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 63, 98, 108),
      //Верхняя панель
      appBar: AppBar(

        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 11, 58, 71),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: Text(
                maxLines: 10,
                yslygi[widget.id].name,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
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
        height: 650,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),

        child: Card(
          color: const Color.fromARGB(255, 63, 98, 108),
          child: Column(
            children: [

              //фото статьи
              Image.asset(yslygi[widget.id].yslygiPhoto[0], scale: 0.7 ),

              const SizedBox(
                height: 5,
              ),


              //описание
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  textAlign: TextAlign.center,
                  yslygi[widget.id].discription,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Actay',
                      height: 0,
                      decoration: TextDecoration.none, backgroundColor: const Color.fromARGB(
                      255, 17, 83, 96)),
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              //цена
              Text(
                textAlign: TextAlign.center,
                "${yslygi[widget.id].complect.toString()}",
                style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 21,
                    fontFamily: 'Actay',
                    height: 0,
                    decoration: TextDecoration.none, backgroundColor: const Color.fromARGB(
                    255, 17, 83, 96)),
              ),

              const SizedBox(
                height: 5,
              ),

              const SizedBox(
                height: 20,
              ),

              //кпонка избранного
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    style: const ButtonStyle(
                        splashFactory: NoSplash.splashFactory),
                    icon: Icon(
                      Icons.favorite,
                      size: 32,
                      color: true == favoriteList.contains(widget.id)
                          ? const Color.fromARGB(255, 11, 58,
                          70)
                          : const Color.fromARGB(255, 255, 255, 255),
                    ),
                    onPressed: () {
                      setState(
                            () {
                          if (false == favoriteList.contains(widget.id)) {
                            favoriteList.add(widget.id);
                            isTap = true;
                          } else if (true == favoriteList.contains(widget.id)) {
                            isTap = false;
                            favoriteList.remove(widget.id);
                          }
                        },
                      );
                    },
                  ),
                  TextButton(
                    style: const ButtonStyle(
                        splashFactory: NoSplash.splashFactory),
                    onPressed: () {
                      setState(
                            () {
                          if (false == favoriteList.contains(widget.id)) {
                            favoriteList.add(widget.id);
                            isTap = true;
                          } else if (true == favoriteList.contains(widget.id)) {
                            isTap = false;
                            favoriteList.remove(widget.id);
                          }
                        },
                      );
                    },
                    child: Text(
                      "Добавить в избранное ",
                      style: TextStyle(
                          color: true == favoriteList.contains(widget.id)
                              ? const Color.fromARGB(255, 11, 58,
                              70)
                              : const Color.fromARGB(255, 255, 255, 255),
                          fontSize: 16,
                          fontFamily: 'Actay',
                          fontWeight: FontWeight.w700,
                          height: 0,
                          decoration: TextDecoration.none),
                    ),
                  )
                ],
              ),

              //выпадающий список
              // DropdownButton<String>(
              //   value: dropdownValue,
              //   items: items.map<DropdownMenuItem<String>>((String value) {
              //     return DropdownMenuItem<String>(value: value, child: Text(value));
              //   }).toList(),
              //   onChanged: (String? newValue) {
              //     setState(() {
              //       dropdownValue = newValue ?? '';
              //     });
              //   },
              // ),

              const SizedBox(
                width: 0,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  //кнопка покупки
                  Padding(padding: EdgeInsets.only(top: 0),

                      child:

                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Вы уверены, что хотите купить этот товар?"),
                                actions: <Widget>[
                                  ElevatedButton(
                                    child: Text("купить", style: const TextStyle(color: Colors.white)),
                                    onPressed: () {
                                      // Переносим товары из корзины в историю покупок
                                      Car_in_shopping_list.addAll(shopList); // Добавляем все товары из корзины в историю
                                      shopList.clear(); // Очищаем корзину

                                      // Показываем SnackBar с сообщением
                                      _showSnackBar("Ваш заказ оформлен, с Вами свяжется наш оператор.");

                                      // Обновляем UI
                                      setState(() {});

                                      // Закрываем диалог
                                      Navigator.of(context).pop();
                                    },
                                    style: ButtonStyle(

                                        backgroundColor: MaterialStateProperty.all<Color>(Color(
                                            0xFF0F3B49))),),
                                  ElevatedButton(
                                    child: Text("отмена", style: const TextStyle(color: Colors.white)),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    style: ButtonStyle(

                                        backgroundColor: MaterialStateProperty.all<Color>(Color(
                                            0xFF0F3B49))
                                    ),
                                  ),
                                ],

                              );
                            },
                          );
                        },
                        child: Text("Купить услугу", style: const TextStyle(fontSize: 20, color: Colors.white)),
                        style:
                          ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            backgroundColor: const Color.fromARGB(255, 11, 58,
                                70),
                          )),

                      )


            ],
          ),

              Text(
                textAlign: TextAlign.center,
                "*${yslygi[widget.id].compl.toString()}",
                style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 15,
                    fontFamily: 'Actay',
                    height: 0,
                  ),
              ),
          ]
        ),
      ),
    ),
    ),
    )
            )
            )
    );
  }
}
