import 'package:flutter/material.dart';

import '/config/_config.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.controller,
    this.hintText,
    this.labelText,
    this.leadingIcon,
    this.trailingIcon,
    this.onLeadingIconPressed,
    this.onTrailingIconPressed,
    this.obscureText = false,
    this.validator,
    this.decoration,
  });

  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final void Function()? onLeadingIconPressed;
  final void Function()? onTrailingIconPressed;
  final bool obscureText;
  final String? Function(String?)? validator;
  final InputDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: inputDecoration(context),
    );
  }

  InputDecoration? inputDecoration(BuildContext context) {
    if (decoration != null) {
      return decoration;
    }

    return InputDecoration(
      hintText: hintText,
      labelText: labelText,
      border: InputBorder.none,
      hintStyle: const TextStyle(color: Colors.grey),
      contentPadding: EdgeInsets.symmetric(horizontal: TPadding.p08),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(TRadius.bR08),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(TRadius.bR08),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(TRadius.bR08),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.error,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(TRadius.bR08),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.error,
        ),
      ),
      prefixIcon: leadingIcon != null ? leadingIconWidget : null,
      suffixIcon: trailingIcon != null ? trailingIconWidget : null,
    );
  }

  Widget get leadingIconWidget => GestureDetector(
        onTap: onLeadingIconPressed,
        child: Icon(
          leadingIcon,
          color: Colors.grey,
        ),
      );

  Widget get trailingIconWidget => GestureDetector(
        onTap: onTrailingIconPressed,
        child: Icon(
          trailingIcon,
          color: Colors.grey,
        ),
      );
}
