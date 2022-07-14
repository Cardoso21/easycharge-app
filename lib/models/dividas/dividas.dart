class Divida {
  int _id;
  String _valor;
  String _dataAbertura;
  String _dataQuitacao;
  String _descricao;
  String _cliente;
  String _statusDivida;

  int get id => _id;

  String get valor => _valor;

  String get statusDivida => _statusDivida;

  String get cliente => _cliente;

  String get descricao => _descricao;

  String get dataQuitacao => _dataQuitacao;

  String get dataAbertura => _dataAbertura;

  set statusDivida(String value) {
    _statusDivida = value;
  }

  set valor(String value) {
    _valor = value;
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

  set id(int value) {
    _id = value;
  }

  Divida(this._id, this._valor, this._dataAbertura, this._dataQuitacao,
      this._descricao, this._cliente, this._statusDivida);

  Map<String, dynamic> mapJson() {
    return {
      'id': _id,
      'valor': _valor,
      'dataAbertura': _dataAbertura,
      'dataQuitacao': _dataQuitacao,
      'descricao': _descricao,
      'cliente': _cliente,
      'statusDivida': _statusDivida
    };
  }
}
