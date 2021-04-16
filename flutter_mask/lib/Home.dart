import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _cpfController = TextEditingController();
  TextEditingController _cnpjController = TextEditingController();

  String _valorRecuperado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mscaras e Validações"),),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(children: <Widget>[
          // CPF
          TextFormField(
            controller: _cpfController,
            keyboardType: TextInputType.number,
            inputFormatters: [
              WhitelistingTextInputFormatter.digitsOnly,
              CpfInputFormatter()
            ],
            decoration: InputDecoration(
              hintText: "Digite CPF"
            ),
          ),

          // CNPJ
            TextFormField(
              controller: _cnpjController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly,
                CnpjInputFormatter()
              ],
              decoration: InputDecoration(
                hintText: "Digite o CNPJ"
              ),
            ),
          RaisedButton(
            child: Text("Recuperar Valor"),
            onPressed: (){
              setState(() {
                _valorRecuperado = _cpfController.text.toString();
                _valorRecuperado = _cnpjController.text.toString();
              });
            },
          ),
          Text(
            "Valor: ${_valorRecuperado}",
            style: TextStyle(
              fontSize: 25
            ),
          )
        ],),
      ),
    );
  }
}