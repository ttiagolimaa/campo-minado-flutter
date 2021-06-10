import 'package:flutter/material.dart';

import '../models/campo.dart';

class CampoWidget extends StatelessWidget {
  final Campo campo;
  final void Function(Campo) onAbrir;
  final void Function(Campo) onAlternarMarcacao;

  const CampoWidget({
    required this.campo,
    required this.onAbrir,
    required this.onAlternarMarcacao,
  });

  Widget _getImage() {
    if (campo.explodido) return Image.asset('assets/images/bomba_0.jpeg');

    if (campo.aberto && campo.minado)
      return Image.asset('assets/images/bomba_1.jpeg');

    if (campo.aberto)
      return Image.asset(
          'assets/images/aberto_${campo.qtdeMinasNaVizinhanca}.jpeg');

    if (campo.marcado) return Image.asset('assets/images/bandeira.jpeg');

    return Image.asset('assets/images/fechado.jpeg');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onAbrir(campo),
      onLongPress: () => onAlternarMarcacao(campo),
      child: _getImage(),
    );
  }
}
