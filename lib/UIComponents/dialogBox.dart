import 'package:flutter/material.dart';

class confirmDismissDialog extends StatelessWidget {
  const confirmDismissDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Confirm"),
      content: const Text(
          "Are you sure you wish to delete this item?"),
      actions: <Widget>[
        IconButton(
            onPressed: () =>
                Navigator.of(context).pop(false),
            icon: Icon(Icons.cancel)),
        IconButton(
          onPressed: () =>
              Navigator.of(context).pop(true),
          icon: Icon(
            Icons.delete,
            color: Colors.redAccent,
          ),
        ),
      ],
    );
  }
}

