import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:okra_widget/okra_widget.dart';
import 'package:okra_widget_official/okra.dart';

void main() => runApp(const OkraFetch());

class OkraFetch extends StatelessWidget {
  const OkraFetch({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Okra API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Okra API Connection', /*balance: '',*/),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title, /*required this.balance*/}) : super(key: key);

  final String title;
  //final String balance;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void callOkraWidget() {
    Okra.buildWithShortUrl(
        context,
        shortUrl: "P-Cc9snYo",
        onSuccess: (data) {
          print("Success");
          //print(data);
          debugPrint('Here is the captured data');
        },
        onError: ( message) {
          print("error");
          print(message);
        },
        onClose: (message) {
          print("close");
          print(message);
        }
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You will be redirected to the OKRA. Click "contine" to proceed'),

            ElevatedButton(
                //color: Colors.green,
                child: const Text(
                  "Click me",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  callOkraWidget();
                }),

            const TextField(

            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}