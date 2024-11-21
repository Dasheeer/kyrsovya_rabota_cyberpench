import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'chat.dart';
import 'isrotia_pokypok.dart';
import 'korzina.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final nameController = TextEditingController();
  final email1Controller = TextEditingController();
  final numberController = TextEditingController();
  late final int id;

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
      backgroundColor: const Color.fromARGB(200, 10, 58, 69),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 11, 58, 71),
        toolbarHeight: 50,
        centerTitle: true,
        title: Text("Профиль",
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
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
      child: Column(
          children: [
      Padding(
      padding: EdgeInsets.all(30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage('https://hombex.com/assets/img/icon_profile.png'),
            ),),

          Expanded(
              flex: 1,
              child: SizedBox()),

          Expanded(
            flex: 5,
            child:  Column(
                children: [

                  Text('Ваши данные',
                    style: TextStyle(fontSize: 24, color: Colors.white,),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                   TextField(
                     controller: nameController,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Actay',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255),
                            width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      hintStyle: TextStyle(
                        fontFamily: 'Actay',
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      hintText: "Имя",
                      hintFadeDuration: Durations.extralong1,
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                   TextField(
                     controller: numberController,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Actay',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255),
                            width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      hintStyle: TextStyle(
                        fontFamily: 'Actay',
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      hintText: "Номер телеф.",
                      hintFadeDuration: Durations.extralong1,
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                   TextField(
                     controller: email1Controller,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Actay',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255),
                            width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      hintStyle: TextStyle(
                        fontFamily: 'Actay',
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      hintText: "Почта",
                      hintFadeDuration: Durations.extralong1,
                    ),
                  ),



                  const SizedBox(
                    height: 10,
                  ),

                  Text('Как сообщить Вам данные о заказе?',
                    style: TextStyle(fontSize: 19, color: Colors.white,),
                  ),

                  const SizedBox(
                    height: 1,
                  ),

                  //выпадающий список
                  DropdownButton<String>(
                    iconSize: 24,
                    elevation: 16,
                    value: dropdownValue,
                    items: items.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(value: value, child: Text(value, style: TextStyle(fontSize: 15, color: const Color.fromARGB(
                          255, 129, 194, 218))));
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue ?? '';
                      });
                    },
                  ),

                   ElevatedButton(
                     style: ElevatedButton.styleFrom(
                       shape:
                       RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                       backgroundColor: const Color.fromARGB(255, 10, 58, 69),

                     ),
                    onPressed: () {
                      CollectionReference collect = FirebaseFirestore.instance.collection('client');
                      collect.add({
                        'name': nameController. text,
                        'mobail': numberController. text,
                        'email': email1Controller. text,
                      }, );
                      _showSnackBar("Ваши данные сохранены.");
                      },

                    child: const   Text(
                      "Сохранить",
                      style: TextStyle(
                        fontFamily: 'Actay',
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ), )
                ]
            ),
          ),

        ],

      ),
    ),

            const SizedBox(
              height: 30,
            ),

    ElevatedButton(
    style: ElevatedButton.styleFrom(
    shape:
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
    backgroundColor: const Color.fromARGB(255, 10, 58, 69),

    ),


    child:


    const Row(
    mainAxisSize: MainAxisSize.min,
    children: [
    SizedBox(width: 2,),
    Text(
          "Список заказов",
         style: TextStyle(
      fontFamily: 'Actay',
        fontSize: 21,
        color: Colors.white,
        ),
       ),
      ],
    ),
       onPressed: () {
        Navigator.push(
        context,
          MaterialPageRoute(
    builder:
        (context) => PurchaseHistory(),
    ),
    );
    },
    ),

            const SizedBox(
              height: 10,
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                backgroundColor: const Color.fromARGB(255, 10, 58, 69),

              ),


              child:


              const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    "Техподдержка",
                    style: TextStyle(
                      fontFamily: 'Actay',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LiveChat(),
                  ),
                );
              },
            ),

            const SizedBox(height: 55),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                backgroundColor: const Color.fromARGB(255, 10, 58, 69),
              ),
              child:
              const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    "Выход",
                    style: TextStyle(
                      fontFamily: 'Actay',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,MaterialPageRoute(builder: (context) => LoginScreen()),);
              },
            ),


          ],
        ),
       )
      );
     }
    }
