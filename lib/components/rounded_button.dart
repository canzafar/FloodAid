import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color colour;
  final String textChild;
  final void Function() onpress;
  RoundedButton(
      {required this.textChild, required this.colour, required this.onpress()});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () => onpress(),
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            textChild,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 20.0
            ),
          ),
        ),
      ),
    );
  }
}