import 'package:campo_minado/widgets/campo_widget.dart';
import 'package:flutter/material.dart';

import '../models/campo.dart';
import '../models/tabuleiro.dart';

class TabuleiroWidget extends StatelessWidget {
  final Tabuleiro tabuleiro;
  final void Function(Campo) onAbrir;
  final void Function(Campo) onAlterarMarcacao;

  const TabuleiroWidget({
    required this.tabuleiro,
    required this.onAbrir,
    required this.onAlterarMarcacao,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: tabuleiro.colunas,
        children: tabuleiro.campos
            .map((c) => CampoWidget(
                  campo: c,
                  onAbrir: onAbrir,
                  onAlternarMarcacao: onAlterarMarcacao,
                ))
            .toList(),
      ),
    );
  }
}
