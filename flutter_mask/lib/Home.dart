import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _cpfController = TextEditingController();
  TextEditingController _cnpjController = TextEditingController();
  TextEditingController _cepController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _dataController = TextEditingController();
  TextEditingController _moedaController = TextEditingController();

  String _valorRecuperado = "";

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Máscaras e Validações"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(children: <Widget>[
          // CPF
          TextField(
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
              TextField(
                controller: _cnpjController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                  CnpjInputFormatter()
                ],
                decoration: InputDecoration(hintText: "Digite o CNPJ"),
              ),

              // CEP
              TextField(
                controller: _cepController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                  CepInputFormatter()
                ],
                decoration: InputDecoration(hintText: "Digite o CEP"),
              ),

               // TELEFONE
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                  TelefoneInputFormatter()
                ],
                decoration: InputDecoration(hintText: "Digite o Celular"),
              ),

              // DATA
              TextField(
                controller: _dataController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                  DataInputFormatter()
                ],
                decoration: InputDecoration(hintText: "Digite o Celular"),
              ),

              // Moeda
              TextField(
                controller: _moedaController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                  RealInputFormatter(centavos: true)
                ],
                decoration: InputDecoration(hintText: "Digite o Celular"),
              ),
        ElevatedButton(
          child: Text("Recuperar valor"),
          onPressed: (){
            setState(() {
              _valorRecuperado = _cpfController.text.toString();
              //_valorRecuperado = _cnpjController.text.toString();
              //_valorRecuperado = _cepController.text.toString();
              //_valorRecuperado = _phoneController.text.toString();
              //_valorRecuperado = _dataController.text.toString();
              //_valorRecuperado = _moedaController.text.toString();

              /* Preparando para salvar
              String moedaDB = _moedaController.text.toString();
              moedaDB = moedaDB.replaceAll(".", "");
              moedaDB = moedaDB.replaceAll(",", ".");

              //Exibindo:
              //_valorRecuperado = moedaDB;
              double valorDouble = double.parse(moedaDB);
              var formatador = NumberFormat("#,##0.00", "pt_BR");
              var resultado = formatador.format( valorDouble );

              //_valorRecuperado = resultado;
              //_valorRecuperado = "DB: ${ moedaDB } / Exibição: ${ resultado }";
              // Padrões
              //for ( var item in Estados.listaEstados){
              for ( var item in Estados.listaEstadosSigla){
                print("item: ${item}");
              }
            */
            });
          },
          ),
        Text(
          "Valor: ${_valorRecuperado}",
          style: TextStyle(
            fontSize:25
          )
        )
        ],
        )
      ),
    );
  }
}
