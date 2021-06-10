import 'package:campo_minado/widgets/resultado_widget.dart';
import 'package:flutter/material.dart';

class CampoMinadoApp extends StatelessWidget {
  _reiniciar() {
    print('reiniciar...');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(
          onReiniciar: _reiniciar,
          venceu: null,
        ),
        body: Center(
          child: Text('Tabuleiro'),
        ),
      ),
    );
  }
}
