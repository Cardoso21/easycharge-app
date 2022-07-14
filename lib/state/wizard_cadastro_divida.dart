import 'package:flutter/material.dart';

import '../models/clientes/cliente.dart';
import '../models/dividas/dividas.dart';

class WizardCadastroDeDividasState extends ChangeNotifier {
  int _id = 0;
  String _valor = '';
  String _dataAbertura = '';
  String _dataQuitacao = '';
  String _descricao = '';
  String _cliente = '';
  String _statusDivida = '';

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

  String get statusDivida => _statusDivida;

  String get cliente => _cliente;

  String get descricao => _descricao;

  String get dataQuitacao => _dataQuitacao;

  String get dataAbertura => _dataAbertura;

  String get valor => _valor;

  set quantidadeDeEtapas(int value) {
    _quantidadeDeEtapas = value;
  }

  set passoAtual(int value) {
    _passoAtual = value;
  }

  set statusDivida(String value) {
    _statusDivida = value;
  }

  set cliente(String value) {
    _cliente = value;
  }

  set descricao(String value) {
    _descricao = value;
  }

  set dataQuitacao(String value) {
    _dataQuitacao = value;
  }

  set dataAbertura(String value) {
    _dataAbertura = value;
  }

  set valor(String value) {
    _valor = value;
  }

  Divida criaDivida() {
    Divida divida = Divida(_id, _valor, _dataAbertura, _dataQuitacao,
        _descricao, _cliente, _statusDivida);

    _id = 0;
    _valor = '';
    _dataAbertura = '';
    _dataQuitacao = '';
    _descricao = '';
    _cliente = '';
    _statusDivida = '';

    return divida;
  }
}
