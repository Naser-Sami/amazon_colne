import 'package:flutter/material.dart';

class AuthListTile extends StatelessWidget {
  final String title;
  final Object value;
  final Object? groupValue;
  final ValueChanged<Object?>? onChanged;

  const AuthListTile({
    super.key,
    required this.title,
    required this.value,
    this.groupValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: value == groupValue ? Theme.of(context).colorScheme.surface : Colors.transparent,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      leading: Radio.adaptive(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        activeColor: Theme.of(context).colorScheme.surfaceTint,
      ),
    );
  }
}
