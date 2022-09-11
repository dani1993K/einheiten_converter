import 'package:flutter/material.dart';
final items = ['Meter', 'Kilometer','Feet','Mile'];
TextEditingController txt = TextEditingController();
TextEditingController validateInput = TextEditingController();
String? valueTo;
String? valueFrom;

//list of items for DropdownFields

void main() {
  runApp(const MyApp());
  // This method runs the App.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Einheiten Konverter App',
      home: HomeApp('Einheiten Konverter'),
      //
    );
  }
}

class HomeApp extends StatelessWidget {
  const HomeApp(this.title, {super.key});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB (0,20,0,0),
            child: Text('Wert', style: TextStyle(fontSize: 25)),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB (20,0,20,5),
            child: InputValue(),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB (0,15,0,0),
            child: Text('Von', style: TextStyle(fontSize: 25)),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB (20,0,20,5),
            child: DropDownButtonFrom(),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB (0,15,0,0),
            child: Text('Nach', style: TextStyle(fontSize: 25)),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB (20,0,20,5),
            child: DropDownButtonTo(),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB (20,5,20,0),
            child: Button(),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB (20,5,20,0),
            child: OutputValue(),
          ),
        ]
      )
    );
  }
}

class InputValue extends StatelessWidget {
  const InputValue({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: validateInput,
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

class DropDownButtonFrom extends StatefulWidget {
  const DropDownButtonFrom({super.key});

  @override
  State<DropDownButtonFrom> createState () => _DropDownButtonFromState();
}

class _DropDownButtonFromState extends State<DropDownButtonFrom> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: valueFrom,
      isExpanded: true,
      onChanged: (value) => setState(() => valueFrom = value) ,
      items: items.map(buildMenuItem).toList(),
    );
  }
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
    item,
    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue),
  ),
  );
}

class DropDownButtonTo extends StatefulWidget {
  const DropDownButtonTo({super.key});

  @override
  State<DropDownButtonTo> createState () => _DropDownButtonToState();
}

class _DropDownButtonToState extends State<DropDownButtonTo> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: valueTo,
      isExpanded: true,
      onChanged: (value) => setState(() => valueTo = value) ,
      items: items.map(buildMenuItem).toList(),
    );
  }
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(
      item,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue),
    ),
  );
}

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState () => _ButtonState();
}

class _ButtonState extends State<Button> {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(100,40),
        textStyle: const TextStyle(fontSize: 25),
        backgroundColor: Colors.white38,
        foregroundColor: Colors.blueAccent,
      ),
      child: const Text('Konvertieren'),
      onPressed: () {
        if(validateInput.text.isEmpty){
          txt.text = 'Bitte Wert eingeben';
        }
        if(!RegExp('[0-9]').hasMatch(validateInput.text)){
          txt.text = 'Nur Zahlen sind erlaubt';
        }
        if(valueTo!.isEmpty){
          txt.text = "Bitte Ziel-Format eingeben";
        }
      },
    );
  }
}

class OutputValue extends StatelessWidget {
  const OutputValue({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: txt,
      enabled: false,
      textAlign: TextAlign.center,
      decoration: const InputDecoration(
        border:InputBorder.none,
        hintText: 'hier kommt der output',
        labelStyle: TextStyle(
          fontSize: 30,
        ),
      ),
    );
  }
}