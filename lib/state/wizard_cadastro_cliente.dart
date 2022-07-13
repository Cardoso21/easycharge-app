import 'package:flutter/material.dart';

import '../models/clientes/cliente.dart';


class WizardCadastroDeClienteState extends ChangeNotifier {

  int _id = 0;
   String _nome = '';
   String _cpf = '';
   String _telefone = '';
   String _email = '';
   String _profissao = '';
   double _renda = 0;
   String _status = '';
   String _rua = '';
   String _numero = '';
   String _bairro = '';
   String _cidade = '';
   String _estado = '';

  int _passoAtual = 0;
  int _quantidadeDeEtapas = 2;

  int get passoAtual => _passoAtual;

  void avanca() {
    _passoAtual += 1;
    notifyListeners();
  }

  void volta() {
    if (_passoAtual > 0) {
      _passoAtual -= 1;
      notifyListeners();
    }
  }

  int get quantidadeDeEtapas => _quantidadeDeEtapas;


  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  String get cpf => _cpf;

  set cpf(String value) {
    _cpf = value;
  }


  String get telefone => _telefone;

  set telefone(String value) {
    _telefone = value;
  }


  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get profissao => _profissao;

  set profissao(String value) {
    _profissao = value;
  }

   double get renda => _renda;

  set renda(double value) {
    _renda = value;
  }

  String get status => _status;

  set status(String value) {
    _status = value;
  }


  String get rua => _rua;

  set rua(String value) {
    _rua = value;
  }

  String get numero => _numero;

  set numero(String value) {
    _numero = value;
  }

  String get bairro => _bairro;

  set bairro(String value) {
    _bairro = value;
  }

  String get cidade => _cidade;

  set cidade(String value) {
    _cidade = value;
  }

  String get estado => _estado;

  set estado(String value) {
    _estado = value;
  }

  Cliente criaCliente() {
    Cliente cliente = Cliente(_id,_nome, _cpf,_telefone,_email,_profissao,_renda,_status,_rua,_numero,_bairro,_cidade,_estado,);
    _id = 0;
    _nome = '';
    _cpf = '';
    _telefone ='';
    _email= '';
    _profissao= '';
    _renda=0;
    _status='';
    _rua='';
    _numero='';
    _bairro='';
    _cidade='';
    _estado='';

    return cliente;
  }

}
