import 'package:flutter/material.dart';
final items = ['Meter', 'Kilometer','Feet','Mile'];

void main() {
  runApp(MyApp());
  // This method runs the App.
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Einheiten Converter App',
      home: HomeApp('Einheiten Converter'),
      //
    );
  }
}

class HomeApp extends StatelessWidget {
  HomeApp(this.title);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB (0,20,0,5),
            child: const Text('Wert', style: const TextStyle(fontSize: 25)),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB (20,5,20,5),
            child: InputWert(),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB (0,15,0,5),
            child: const Text('Von', style: const TextStyle(fontSize: 25)),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB (20,5,20,5),
            child: DropDownButtonVon(),
          ),
          Text('Nach', style: const TextStyle(fontSize: 25)),
        ]
      )
    );
  }
}

class InputWert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        border:UnderlineInputBorder(),
        hintText: 'Bitten geben Sie den zu konvertierenden Wert ein',
        labelStyle: TextStyle(
          fontSize: 30,
        ),
      ),
    );
  }
}

class DropDownButtonVon extends StatefulWidget {
  State<DropDownButtonVon> createState () => _DropDownButtonVonState();
}

class _DropDownButtonVonState extends State<DropDownButtonVon> {
  String? value;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      onChanged: (value) => setState(() => this.value = value) ,
      items: items.map(buildMenuItem).toList(),
    );
  }
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
    item,
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
  ),
  );
}