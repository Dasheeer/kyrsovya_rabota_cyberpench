import 'package:flutter/material.dart';
import 'isrotia_pokypok.dart';
import 'module/date_base.dart';

List<int> shopList = [];
List<List<int>> test = [];
List<int> purchaseHistory = [];

String dropdownValue = 'Позвоните по номеру';

List<String> items = <String>[
  'Позвоните по номеру',
  'Отправьте смс',
  'Отправьте email',
];

double sumPriceCar() {
  double summaList = 0;
  int numberOfMoves = shopList.length;

  for (int i = 0; i < numberOfMoves; i++) {
    summaList += yslygi[shopList[i]].price; // Получаем цену товара по индексу
  }

  return summaList;
}

class ShopCar extends StatefulWidget {
  const ShopCar({super.key, required int id});

  @override
  State<ShopCar> createState() => _ShopCarState();
}

class _ShopCarState extends State<ShopCar> {
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
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 11, 58, 71),
        toolbarHeight: 50,
        centerTitle: true,
        title: Text("Корзина",
            style: const TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w700,
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 630,
            child: ListView.builder(
              itemCount: shopList.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (_) {
                    setState(() {
                      shopList.removeAt(index);
                    });
                  },
                  child: Card(
                    color: const Color.fromARGB(255, 10, 58, 69),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                      ),
                      child: ListTile(
                        title: Text(
                          yslygi[shopList[index]].name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'Actay',
                            height: 0,
                            decoration: TextDecoration.none,
                            color: Colors.white,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              shopList.removeAt(index);
                            });
                          },
                          icon: const Icon(
                            Icons.delete_forever,
                            color: Colors.white,
                          ),
                        ),
                        leading: Image.asset(
                            yslygi[shopList[index]].yslygiPhoto[0]),
                        subtitle: Text(
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'Actay',
                            height: 0,
                            decoration: TextDecoration.none,
                            color: Colors.white,
                          ),
                          yslygi[shopList[index]].price.toString(),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 120,
            decoration: const BoxDecoration(
              color: Color.fromARGB(0, 10, 58, 69),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Итог: ${sumPriceCar().toString()}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Actay',
                    height: 0,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Вы уверены, что хотите оформить заказ?"),
                            actions: <Widget>[
                              ElevatedButton(
                                child: Text("оформить", style: const TextStyle(color: Colors.white)),
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
                                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF0F3B49)),
                                ),
                              ),
                              ElevatedButton(
                                child: Text("отмена", style: const TextStyle(color: Colors.white)),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF0F3B49)),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text("Оформить заказ", style: const TextStyle(fontSize: 20, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      backgroundColor: const Color.fromARGB(255, 11, 58, 70),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
