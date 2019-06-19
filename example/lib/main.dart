import 'package:flutter/material.dart';
import 'package:flutter_ravepay/flutter_ravepay.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Ravepay ravePay;
  RavepayResult _result;

  void chargeCard() async {
    final RavepayResult result = await ravePay.chargeCard(
      const RavepayConfig(
        amount: 5.0,
        country: "US",
        currency: "USD",
        email: "evenmatrix@gmail.com",
        firstname: "Onyemaechi",
        lastname: "Okafor",
        narration: "Test Payment",
        publicKey: "XXXXXX",
        encryptionKey: "XXXXXX",
        txRef: "XXXX",
        useAccounts: true,
        useCards: true,
        isStaging: false,
        useSave: true,
        metadata: [
          const RavepayMeta("email", "evenmatrix@gmail.com"),
          const RavepayMeta("id", "1994"),
        ],
      ),
    );

    setState(() {
      _result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    ravePay = Ravepay.of(context);

    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter Ravepay'),
        ),
        body: new Center(
          child: SingleChildScrollView(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new RaisedButton(
                  color: Colors.green,
                  onPressed: () => chargeCard(),
                  child: new Text("TEST"),
                ),
                SizedBox(
                  height: 16.0,
                ),
                new Text('Working?: ${_result?.toMap()}\n'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
