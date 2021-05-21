import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validadores/validadores.dart';

class Formulario extends StatefulWidget {
  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _idadeController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String _mensagem = "";
  String _nome;
  String _idade;
  String _cpf;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Fromulário"),
      ),
      body:Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                hintText: "Digite seu Nome"
              ),
              validator: (valor){

                return Validador()
                  .add(Validar.OBRIGATORIO, msg: "Campo obrigatório")
                  .minLength(5, msg: "Mínimo de 5 caracteres!")
                  .valido(valor);
              },
            ),

            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: "Digite sua Idade"),
              validator: (valor) {
                return Validador()
                  .add(Validar.OBRIGATORIO, msg: "Campo obrigatório")
                  .valido(valor);
              },
            ),

            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly,
                CpfInputFormatter()
              ],
              decoration: InputDecoration(hintText: "Digite o seu CPF"),
              validator: (valor) {
                return Validador()
                  .add(Validar.OBRIGATORIO, msg: "Campo obrigatório")
                  .add(Validar.CNPJ, msg: "CPF Inválido!")
                  .minLength(11)
                  .maxLength(11)
                  .valido(valor);
              },
            ),
            ElevatedButton(
              child:Text("Salvar"),
              onPressed: (){
                if(_formKey.currentState.validate()){
                  setState(() {
                    _nome = _nomeController.text;
                    _nome = _idadeController.text;
                    _nome = _cpfController.text;
                    _mensagem = "Nome: ${_nome} idade: ${_idade} CPF: ${_cpf}";
                  });
                }
              },
            ),
            Text(
              _mensagem,
              style: TextStyle(
                fontSize:25
                 ),
              )
          ]),
        ),
      ),
    );
  }
}