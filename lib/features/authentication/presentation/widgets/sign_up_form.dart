import 'package:flutter/material.dart';

import '/core/_core.dart';
import '/config/_config.dart';

class SignUpForm extends StatelessWidget {
  final Key? singUpFormKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignUpForm(
      {super.key,
      required this.singUpFormKey,
      required this.nameController,
      required this.emailController,
      required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(TPadding.p08),
        child: Form(
          key: singUpFormKey,
          child: Column(
            spacing: TSize.s10,
            children: [
              // Name.
              TextFormFieldWidget(
                labelText: "Name",
                controller: nameController,
                validator: (String? value) => TValidator.validateEmptyText('Name', value),
              ),
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

              // Sign-Up button.
              ElevatedButton(
                onPressed: () {},
                child: Text("Sign-Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
