import 'package:flutter/material.dart';

import '/core/_core.dart';
import '/config/_config.dart';

class SignInForm extends StatelessWidget {
  final Key? singInFormKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignInForm(
      {super.key,
      required this.singInFormKey,
      required this.emailController,
      required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(TPadding.p08),
        child: Form(
          key: singInFormKey,
          child: Column(
            spacing: TSize.s10,
            children: [
              // Email.
              TextFormFieldWidget(
                labelText: "Email",
                controller: emailController,
                validator: (String? value) => TValidator.validateEmail(value),
              ),
              // Password.
              TextFormFieldWidget(
                labelText: "Password",
                controller: passwordController,
                obscureText: true,
                validator: (String? value) => TValidator.validatePassword(value),
              ),

              // Sign-In button.
              ElevatedButton(
                onPressed: () {},
                child: Text("Sign-In."),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
