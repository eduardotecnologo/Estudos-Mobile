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
  TextEditingController _cepController = TextEditingController();
  TextEditingController _moedaController = TextEditingController();
  TextEditingController _pesoController = TextEditingController();
  TextEditingController _telefoneController = TextEditingController();
  TextEditingController _dataController = TextEditingController();
  TextEditingController _horaController = TextEditingController();

  String _valorRecuperado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tipos de Mscaras e Validações"),),
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
            // CEP
            TextFormField(
              controller: _cepController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly,
                CepInputFormatter()
              ],
              decoration: InputDecoration(hintText: "Digite o CEP"),
            ),
            // MOEDA
            TextFormField(
              controller: _moedaController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly,

                RealInputFormatter(centavos: true)
              ],
              decoration: InputDecoration(hintText: "Digite o Valor em Real"),
            ),
            // Peso
            TextFormField(
              controller: _pesoController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly,
                PesoInputFormatter()
              ],
              decoration: InputDecoration(hintText: "Digite o Peso"),
            ),
            // Telefone
            TextFormField(
              controller: _telefoneController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly,
                TelefoneInputFormatter()
              ],
              decoration:
                  InputDecoration(hintText: "Digite o Telefone"),
            ),
            // Data
            TextFormField(
              controller: _dataController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly,
                DataInputFormatter()
              ],
              decoration: InputDecoration(hintText: "Digite a Data"),
            ),
            // Hora
            TextFormField(
              controller: _horaController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly,
                HoraInputFormatter()
              ],
              decoration: InputDecoration(hintText: "Digite a Hora"),
            ),
          RaisedButton(
            child: Text(
              "Recuperar Valor",
              style: TextStyle(
                color: Colors.blue.shade900,
                fontSize: 20
                ),
              ),
              color: Color(0xfffff200),
            onPressed: (){
              setState(() {
                // _valorRecuperado = _cpfController.text.toString();
                // _valorRecuperado = _cnpjController.text.toString();
                // _valorRecuperado = _cepController.text.toString();
                // _valorRecuperado = _moedaController.text.toString();
                String moedaDB = _moedaController.text.toString();
                moedaDB = moedaDB.replaceAll(".", "");
                moedaDB = moedaDB.replaceAll(",", ".");
                // _valorRecuperado = moedaDB;
                double valorDouble = double.parse(moedaDB);

                var formatador = NumberFormat("#,##0.00", "pt_BR");
                var resultado = formatador.format(valorDouble);
                _valorRecuperado = "DB ${moedaDB} / Exibição: ${resultado}";

                // _valorRecuperado = _pesoController.text.toString();
                // _valorRecuperado = _telefoneController.text.toString();
                // _valorRecuperado = _dataController.text.toString();
                // _valorRecuperado = _horaController.text.toString();
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