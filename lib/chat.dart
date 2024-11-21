import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LiveChat extends StatefulWidget {

  @override
  State<LiveChat> createState() => _LiveChatState();
}

class _LiveChatState extends State<LiveChat> {
  final String title = "Conve Online Agent";
  //final String selecteUrl = " ";
  final Completer<WebVierController> _controller =
  Completer<WebVierController>();

  int position = 1;

  final key = UniqueKey();

  get startLoading => null;

doneLoading(String A){
  setState(() {
    position = 0;
  });
}

starLoading(String A){
  setState(() {
    position = 1;
  });
}

@override
  Widget build(BuildContext context) {
  return new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'CyberPenchSupport',
    home: new Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 10, 58, 69),
        title: new Text(
          'CyberPenchSupport',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
              splashColor: Colors.black,
              highlightColor: Colors.blue.withOpacity(0.5),
              onTap: () {
                print("Back");
                Navigator.pop(context, true);
              },
              child: Icon(Icons.arrow_back, color: Colors.white, size: 30.0),
            ),
          ),
        ],
      ),
      body: IndexedStack(index: position, children: <Widget>[
        WebView(
          initialUrl: 'https://tawk.to/chat/66f308674cbc4814f7de0b70/1i8ilhl2e',
          javascriptMode: JavascriptMode.unrestricted,
          key: key,
          onPageFinished: doneLoading,
          onPageStarted: startLoading,
        ),
        Container(
          color: Colors.white,
          child: Center(child: CircularProgressIndicator()),
        ),

      ],

      ),

    ),
  );
}}

class WebVierController {
}
