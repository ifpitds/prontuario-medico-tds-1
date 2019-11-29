import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _txtNome = new TextEditingController();
  TextEditingController _txtIdade = new TextEditingController();
  TextEditingController _txtData = new TextEditingController();
  TextEditingController _txtSintomas = new TextEditingController();
  DateTime selectedDate = new DateTime.now(); //data selecionada

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      print("Data selecionada: ${picked.toString()}");
    setState(() {
      this.selectedDate = picked;
    });
  }

  void onReset() {
    //setState(() {
    this._txtNome.text = "";
    this._txtIdade.text = "";
    this._txtData.text = "";
    this._txtSintomas.text = "";
    //});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Prontuário médico'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                this.onReset();
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.all(15),
                  child: new Text("Dados clínicos",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                new Container(
                  child: new TextField(
                    keyboardType: TextInputType.text,
                    style: new TextStyle(
                        fontSize: 12.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w200,
                        fontFamily: "Roboto"),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Nome",
                      hintText: "Digite o seu nome",
                    ),
                    controller: this._txtNome,
                  ),
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                  alignment: Alignment.center,
                ),
                new Container(
                  child: new TextField(
                    keyboardType: TextInputType.number,
                    style: new TextStyle(
                        fontSize: 12.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w200,
                        fontFamily: "Roboto"),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Idade",
                        hintText: "digite sua idade"),
                    controller: this._txtIdade,
                  ),
                  padding: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                ),
                new Container(
                  child: new TextField(
                    style: new TextStyle(
                        fontSize: 12.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w200,
                        fontFamily: "Roboto"),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Data",
                      hintText: "Digite a data da consulta",
                    ),
                    controller: this._txtData,
                  ),
                  padding: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                ),
                new Container(
                  child: new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Radio(
                            key: null,
                            groupValue: null,
                            value: .5,
                            onChanged: radioChanged),
                        new Text(
                          "masculino",
                          style: new TextStyle(
                              fontSize: 12.0,
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w200,
                              fontFamily: "Roboto"),
                        ),
                        new Radio(
                            key: null,
                            groupValue: null,
                            value: .5,
                            onChanged: radioChanged),
                        new Text(
                          "feminino",
                          style: new TextStyle(
                              fontSize: 12.0,
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w200,
                              fontFamily: "Roboto"),
                        )
                      ]),
                  padding: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                ),
                new Container(
                  child: new TextField(
                    style: new TextStyle(
                        fontSize: 12.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w200,
                        fontFamily: "Roboto"),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Sintomas",
                      hintText: "Digite seus sintomas",
                    ),
                    controller: this._txtSintomas,
                  ),
                  padding: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                ),
                new Container(
                  child: new RaisedButton(
                    key: null,
                    onPressed: () {},
                    color: Colors.blue,
                    child: new Text(
                      "Cadastrar",
                      style: new TextStyle(
                          fontSize: 12.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w200,
                          fontFamily: "Roboto"),
                    ),
                  ),
                  padding: const EdgeInsets.all(0.0),
                  alignment: Alignment.center,
                )
              ]),
        ));
  }

  void buttonPressed() {}

  void radioChanged(double value) {}
}
