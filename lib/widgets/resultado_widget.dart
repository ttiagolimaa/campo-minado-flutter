import 'package:flutter/material.dart';

class ResultadoWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool? venceu;
  final void Function() onReiniciar;

  const ResultadoWidget({
    required this.venceu,
    required this.onReiniciar,
  });

  Color _getColor() {
    if (venceu == true) return Colors.green.shade300;
    if (venceu == false) return Colors.red.shade300;
    return Colors.yellow;
  }

  IconData _getIcon() {
    if (venceu == true) return Icons.sentiment_very_satisfied;
    if (venceu == false) return Icons.sentiment_very_dissatisfied;
    return Icons.sentiment_satisfied;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundColor: _getColor(),
            child: IconButton(
              padding: EdgeInsets.all(0),
              onPressed: onReiniciar,
              icon: Icon(
                _getIcon(),
                color: Colors.black,
                size: 35,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120);
}
