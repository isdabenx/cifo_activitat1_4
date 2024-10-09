import 'package:flutter/material.dart';

class RowKeyValue extends StatelessWidget {
  const RowKeyValue({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 18,
          ),
        ),
        Chip(
            label: Text(
          value,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ))
      ],
    );
  }
}
