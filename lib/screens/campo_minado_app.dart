import 'package:campo_minado/models/campo.dart';
import 'package:campo_minado/models/explosao_exeption.dart';
import 'package:campo_minado/widgets/campo_widget.dart';
import 'package:campo_minado/widgets/resultado_widget.dart';
import 'package:flutter/material.dart';

class CampoMinadoApp extends StatelessWidget {
  _reiniciar() {
    print('reiniciar...');
  }

  _abrir(Campo campo) {
    print('abir....');
  }

  _alternarMarcacao(Campo campo) {
    print('alternar...');
  }

  @override
  Widget build(BuildContext context) {
    Campo vizinho = Campo(linha: 0, coluna: 1);
    Campo vizinho1 = Campo(linha: 1, coluna: 1);
    Campo campo = Campo(coluna: 0, linha: 0);
    campo.alternarMarcacao();
    // campo.adicionarVizinho(vizinho);
    // campo.adicionarVizinho(vizinho1);
    // vizinho.minar();
    // vizinho1.minar();

    try {
      // campo.abrir();
    } on ExplosaoExeption {}

    return MaterialApp(
      home: Scaffold(
          appBar: ResultadoWidget(
            onReiniciar: _reiniciar,
            venceu: null,
          ),
          body: CampoWidget(
            campo: campo,
            onAbrir: _abrir,
            onAlternarMarcacao: _alternarMarcacao,
          )),
    );
  }
}
