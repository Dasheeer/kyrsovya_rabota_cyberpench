// import 'package:flutter/material.dart';
// import 'module/date_base.dart';
// import 'yslygi_karta.dart';
// import 'izbrannoe.dart';
// import 'korzina.dart';
//
// class ServiceList extends StatefulWidget {
//   const ServiceList({super.key});
//   @override
//   State<ServiceList> createState() => _ServiceListState();
// }
//
// class _ServiceListState extends State<ServiceList> {
//   int selectIndex = -1;
//   List<int> shopList = []; // Список для хранения индексов товаров в корзине
//   int itemCount = 0; // Счетчик товаров в корзине
//
//   void addToCart(int index) {
//     setState(() {
//       shopList.add(index); // Добавляем товар в корзину
//       itemCount = shopList.length; // Обновляем счетчик
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(200, 10, 58, 69),
//       appBar: AppBar(
//         title: Text("Магазин"),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const ShopCar(), // Переход к экрану корзины
//                 ),
//               );
//             },
//             padding: const EdgeInsets.only(bottom: 10.0),
//             icon: Stack(
//               children: [
//                 const Icon(
//                   Icons.shopping_cart_outlined,
//                   size: 28,
//                   color: Color.fromARGB(255, 255, 255, 255),
//                 ),
//                 if (itemCount > 0) // Показываем счетчик только если он больше 0
//                   Positioned(
//                     right: 0,
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//                       decoration: BoxDecoration(
//                         color: Colors.red,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Text(
//                         '$itemCount',
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 12,
//                         ),
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       body:
//
//       Padding(
//         padding: const EdgeInsets.only(top: 5, bottom:0, left:4.0, right:4.0),
//
//         child: GridView.builder(
//           itemCount: catalogCars.length,
//           itemBuilder: _createListView,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisSpacing: 6,
//               crossAxisCount: 2,
//               mainAxisSpacing: 7,
//               childAspectRatio: 5/9),
//         ),),
//     );
//   }
//
//   Widget _createListView(BuildContext context, int index) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => ServiceCard(id: selectIndex),
//             ),
//           );
//           selectIndex = index;
//         });
//       },
//
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 7),
//         decoration: BoxDecoration(
//           border: Border.all(color: Color(0xFFFFFFFF), width: 1.0),
//           borderRadius: BorderRadius.circular(12),
//           image: const DecorationImage(
//             image: AssetImage("lib/assets/image/BACKGROUND/Product.png"),
//             fit: BoxFit.cover,
//           ),
//         ),
//
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             //ИКОНКА
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//
//                 Stack(
//                   alignment: AlignmentDirectional.center,
//                   children: [
//                     IconButton(
//                       padding: EdgeInsets.zero,
//                       icon: true == favoriteList.contains(index)
//                           ? const Icon(
//                         Icons.favorite,
//                         size: 40,
//                       )
//                           : const Icon(
//                         Icons.favorite_border,
//                         size: 40,
//                       ),
//
//                       color: true == favoriteList.contains(index)
//                           ? const Color.fromARGB(255, 255, 0, 0)
//                           : const Color.fromARGB(255, 188, 188, 188),
//                       onPressed: () {
//                         setState(
//                               () {
//                             if (false == favoriteList.contains(index)) {
//                               favoriteList.add(index);
//                             } else if (true == favoriteList.contains(index)) {
//                               favoriteList.remove(index);
//                             }
//                           },
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//
//             //фото услуги
//             Image.asset("lib/assets/image/лого/услуги1.png"),
//
//             const SizedBox(
//               height: 10,
//             ),
//
//             //название услуги
//             SizedBox(
//               height: 60,
//               child: Text(
//                 catalogCars[index].name,
//                 style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 20,
//                     fontFamily: 'ActayWide',
//                     height: 0,
//                     decoration: TextDecoration.none),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//
//             //стоимость
//             Text(
//               "от ${catalogCars[index].price.toString()} руб.",
//               style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 19,
//                   fontFamily: 'ActayWide',
//                   fontWeight: FontWeight.w700,
//                   height: 0,
//                   decoration: TextDecoration.none),
//               textAlign: TextAlign.center,
//             ),
//
//
//             const SizedBox(
//               height: 2,
//             ),
//
//             ElevatedButton(
//               style:
//               ElevatedButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(25)),
//                 backgroundColor: const Color.fromARGB(255, 24, 116, 138),
//               ),
//               child: const Row(
//                 children: [
//                   Icon(
//                     Icons.shopping_cart_outlined,
//                     color: Colors.white,
//                   ),
//                   SizedBox(
//                     width: 8,
//                   ),
//                   Text(
//                     "В корзину",
//                     style: TextStyle(
//                       fontFamily: 'Actay',
//                       fontSize: 20,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//               onPressed: () {
//                 // Здесь вы должны передать индекс товара, который добавляется в корзину
//                 addToCart(0); // Пример добавления товара с индексом 0
//               },
//             ),
//
//           ],
//
//         ),
//
//       ),
//     );
//   }
// }
//
//
//
//
