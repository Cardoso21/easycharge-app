import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../http/webDivida.dart';
import '../../models/dividas/dividas.dart';
import '../../models/dividas/listaDividas.dart';
import '../../state/wizard_cadastro_divida.dart';
import 'dividaLista.dart';

class FormularioDeDivida extends StatelessWidget {
  var passoDadosDividas = _DadosDividasForm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro de cliente')),
      body: Consumer<WizardCadastroDeDividasState>(
        builder: (context, wizardState, child) {
          return Stepper(
            controlsBuilder: (context, details) {
              bool ultimoPasso = details.currentStep ==
                  1; // Coloca a quantidade de passos menos 1
              String rotuloDoUltimoBotao =
              ultimoPasso ? 'Cadastrar' : 'Avançar';

              return Padding(
                padding: EdgeInsets.only(top: 45),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: details.onStepContinue,
                      child: Text(rotuloDoUltimoBotao),
                    ),
                    ElevatedButton(
                      onPressed: details.onStepCancel,
                      child: Text('Voltar'),
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStatePropertyAll(Colors.red)),
                    ),
                  ],
                ),
              );
            },
            currentStep: wizardState.passoAtual,
            onStepContinue: () {
              var funcoes = [_salvaPasso1];

              funcoes[wizardState.passoAtual](context);
            },
            onStepCancel: () => wizardState.volta(),
            steps: [
              Step(
                  title: Text('Dados Pessoais'),
                  content: passoDadosDividas,
                  state: StepState.complete),
            ],
          );
        },
      ),
    );
  }

  void _salvaPasso1(BuildContext context) {
    WizardCadastroDeDividasState state =
    Provider.of<WizardCadastroDeDividasState>(context, listen: false);
    passoDadosDividas.armazenaDadosNoWizard(state);
    Divida divida = state.criaDivida();

    cadastroDivida(divida);

    var listaDeClientes = Provider.of<ListaDeDividas>(context, listen: false);
    listaDeClientes.adicionaDivida(divida);

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => DividaLista()),
            (route) => false);
  }
}

class _DadosDividasForm extends StatelessWidget {
  TextEditingController _valorController = TextEditingController();
  TextEditingController _dataAberturaController = TextEditingController();
  TextEditingController _dataQuitacaoController = TextEditingController();
  TextEditingController _descricaoController = TextEditingController();
  TextEditingController _clienteController = TextEditingController();
  TextEditingController _statusDividaController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: Column(
        children: [
          TextFormField(
            controller: _valorController,
            decoration: InputDecoration(labelText: 'Valor'),
            maxLength: 100,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Informe o Valor!';
              }
            },
          ),
          TextFormField(
            controller: _dataAberturaController,
            decoration:
            InputDecoration(
                labelText: 'Data de Abertura', hintText: '14/07/2022'),
            maxLength: 14,
            keyboardType: TextInputType.number,
          ),
          TextFormField(
            controller: _dataQuitacaoController,
            decoration: InputDecoration(
                labelText: 'Data de Quitacao', hintText: '05/12/2025'),
            maxLength: 15,
            keyboardType: TextInputType.number,
          ),
          TextFormField(
            controller: _descricaoController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(labelText: 'Email'),
            maxLength: 35,
          ),

          TextFormField(
            controller: _clienteController,
            decoration: InputDecoration(
                labelText: 'Nome Do Cliente'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Informe o nome do cliente!';
              }
              return null;
            },
            maxLength: 20,
            keyboardType: TextInputType.text,
          ),
          TextFormField(
            controller: _statusDividaController,
            decoration:
            InputDecoration(labelText: 'Renda', hintText: 'RS: 0,00'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Informe o nome!';
              }
              return null;
            },
            maxLength: 14,
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }

  void armazenaDadosNoWizard(state) {
    state.nome = _valorController.text;
    state.cpf = _dataAberturaController.text;
    state.telefone = _dataQuitacaoController.text;
    state.email = _descricaoController.text;
    state.profissao = _clienteController.text;
    state.status = _statusDividaController.text;
  }

  bool isValido() {
    var currentState = _key.currentState;
    return currentState != null && currentState.validate();
  }
}
