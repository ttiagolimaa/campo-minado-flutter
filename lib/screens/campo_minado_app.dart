import 'package:campo_minado/models/tabuleiro.dart';
import 'package:campo_minado/widgets/tabuleiro_widget.dart';
import 'package:flutter/material.dart';
import '../models/campo.dart';
import '../models/explosao_exeption.dart';
import '../widgets/campo_widget.dart';
import '../widgets/resultado_widget.dart';

class CampoMinadoApp extends StatefulWidget {
  @override
  _CampoMinadoAppState createState() => _CampoMinadoAppState();
}

class _CampoMinadoAppState extends State<CampoMinadoApp> {
  bool? _venceu;
  Tabuleiro? _tabulerio;

  _reiniciar() {
    setState(() {
      _tabulerio?.reiniciar();
      _venceu = null;
    });
  }

  _abrir(Campo campo) {
    if (_venceu != null) return;
    setState(() {
      try {
        campo.abrir();
        if (_tabulerio!.resolvido) {
          _venceu = true;
        }
      } on ExplosaoExeption {
        _venceu = false;
        _tabulerio?.revelarBombas();
      }
    });
  }

  _alternarMarcacao(Campo campo) {
    setState(() {
      campo.alternarMarcacao();
      if (_tabulerio!.resolvido) {
        _venceu = true;
      }
    });
  }

  Tabuleiro getTabuleiro({required double largura, required double altura}) {
    if (_tabulerio == null) {
      int qtdeColunas = 15;
      double tamanhoCampo = largura / qtdeColunas;
      int qtdeLinhas = (altura / tamanhoCampo).floor();

      _tabulerio = Tabuleiro(
        linhas: qtdeLinhas,
        colunas: qtdeColunas,
        qtdeBombas: 40,
      );
    }
    return _tabulerio!;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(
          onReiniciar: _reiniciar,
          venceu: _venceu,
        ),
        body: Container(
          color: Colors.grey,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return TabuleiroWidget(
                tabuleiro: getTabuleiro(
                    largura: constraints.maxWidth,
                    altura: constraints.maxHeight),
                onAbrir: _abrir,
                onAlterarMarcacao: _alternarMarcacao,
              );
            },
          ),
        ),
      ),
    );
  }
}
