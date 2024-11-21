import 'package:flutter/material.dart';
import 'module/date_base.dart';


List<int> Car_in_shopping_list = [];
List<List<int>> test = [];


class PurchaseHistory extends StatefulWidget {
  const PurchaseHistory({super.key});


  @override
  State<PurchaseHistory> createState() => _PurchaseHistoryState();
}

class _PurchaseHistoryState extends State<PurchaseHistory> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 63, 98, 108),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 11, 58, 71),
        toolbarHeight: 50,
        centerTitle: true,
        title: Text("Список заказов",
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

      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 750,
            child: ListView.builder(
              itemCount: Car_in_shopping_list.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (_) {
                    setState(() {
                      Car_in_shopping_list.removeAt(index);
                    });
                  },
                  child: Card(
                    color:  const Color.fromARGB(255, 10, 58, 69),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                      ),
                      child: ListTile(
                        title: Text(
                          yslygi[Car_in_shopping_list[index]].name,
                          style: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'Actay',
                              height: 1,
                              decoration: TextDecoration.none,
                              color:  const Color.fromARGB(255, 255, 255, 255)),
                        ),
                        leading: Image.asset(
                            yslygi[Car_in_shopping_list[index]].yslygiPhoto[0]),
                        subtitle: Text(
                            style: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Actay',
                                height: 0,
                                decoration: TextDecoration.none,
                              color: const Color.fromARGB(255, 255, 255, 255)),
                            yslygi[Car_in_shopping_list[index]].price.toString()),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}