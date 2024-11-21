import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/snack_bar.dart';
import 'module/date_base.dart';
import 'yslygi_karta.dart';
import 'izbrannoe.dart';
import 'korzina.dart';

class ServiceList extends StatefulWidget {
  const ServiceList({super.key});
  @override
  State<ServiceList> createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  int selectIndex = -1;
  late final int id;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: const Color.fromARGB(200, 10, 58, 69),

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 11, 58, 71),
        toolbarHeight: 50,
        flexibleSpace: Container(),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.white,
            height: 2.5,
          ),
        ),
        centerTitle: true,
        title: Row(
          children: [
            Expanded(
              child: Center(
                child: const Text(
                  "Услуги",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                if (shopList.isNotEmpty) {
                  // Получаем id последнего добавленного товара в корзину
                  int carId = shopList.last; // Или другой логики для выбора id
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShopCar(id: carId), // Передаем id
                    ),
                  );
                } else {
                  SnackBarService.showSnackBar(
                    context,
                    'Корзина пуста!',
                    true,
                  );
                }
              },
              padding: const EdgeInsets.only(bottom: 10.0),
              icon: const Icon(
                Icons.account_balance_wallet_rounded,
                size: 30,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ],
        ),
      ),


        body:

Padding(
    padding: const EdgeInsets.only(top: 5, bottom:0, left:4.0, right:4.0),

      child: GridView.builder(
        itemCount: yslygi.length,
        itemBuilder: _createListView,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 6,
            crossAxisCount: 2,
            mainAxisSpacing: 7,
            childAspectRatio: 5/9),
      ),),
    );
  }

  Widget _createListView(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ServiceCard(id: selectIndex),
            ),
          );
          selectIndex = index;
        });
      },

      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7),
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

                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: true == favoriteList.contains(index)
                          ? const Icon(
                              Icons.favorite,
                              size: 40,
                            )
                          : const Icon(
                              Icons.favorite_border,
                              size: 40,
                            ),

                      color: true == favoriteList.contains(index)
                          ? const Color.fromARGB(255, 255, 0, 0)
                          : const Color.fromARGB(255, 188, 188, 188),
                      onPressed: () {
                        setState(
                          () {
                            if (false == favoriteList.contains(index)) {
                              favoriteList.add(index);
                            } else if (true == favoriteList.contains(index)) {
                              favoriteList.remove(index);
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),

            //фото услуги
            Image.asset("lib/assets/image/лого/услуги1.png"),

            const SizedBox(
              height: 10,
            ),

            //название услуги
            SizedBox(
              height: 60,
              child: Text(
                yslygi[index].name,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'ActayWide',
                    height: 0,
                    decoration: TextDecoration.none),
                textAlign: TextAlign.center,
              ),
            ),

            //стоимость
            Text(
              "от ${yslygi[index].price.toString()} руб.",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontFamily: 'ActayWide',
                  fontWeight: FontWeight.w700,
                  height: 0,
                  decoration: TextDecoration.none),
              textAlign: TextAlign.center,
            ),


            const SizedBox(
              height: 2,
            ),

            ElevatedButton(
              style:
              ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                backgroundColor: const Color.fromARGB(255, 24, 116, 138),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "В корзину",
                    style: TextStyle(
                      fontFamily: 'Actay',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                shopList.add(index);
              },
            ),

          ],

        ),

        ),
        );
  }
}
