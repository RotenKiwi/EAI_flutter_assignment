import 'package:flutter/material.dart';


class dismissibleBackground extends StatelessWidget {
  const dismissibleBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Icon(Icons.delete),
          Spacer(),
          Icon(Icons.delete),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}