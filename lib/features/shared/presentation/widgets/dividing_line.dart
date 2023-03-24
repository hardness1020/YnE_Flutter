import 'package:flutter/material.dart';

class DividingLine extends StatelessWidget {
  const DividingLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: Divider(
            color: Colors.grey,
            height: 4,
            thickness: 1,
            indent: 10,
            endIndent: 20,
          ),
        ),
        Text('或'),
        Expanded(
          child: Divider(
            color: Colors.grey,
            height: 4,
            thickness: 1,
            indent: 20,
            endIndent: 10,
          ),
        ),
      ],
    );
  }
}
