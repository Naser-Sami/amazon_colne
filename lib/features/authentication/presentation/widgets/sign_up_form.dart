import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '/core/_core.dart';
import '/config/_config.dart';
import '/features/_features.dart';

class SignUpForm extends StatefulWidget {
  final GlobalKey<FormState> singUpFormKey;
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
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  // Sing up function
  void singUp() {
    // check if fields are valid
    if (widget.singUpFormKey.currentState!.validate()) {
      // sing up event
      context.read<AuthBloc>().add(SingUpEvent(
            username: widget.nameController.text.trim(),
            email: widget.emailController.text.trim(),
            password: widget.passwordController.text.trim(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(TPadding.p08),
        child: BlocListener<AuthBloc, AuthState>(
          listener: listener,
          child: Form(
            key: widget.singUpFormKey,
            child: Column(
              spacing: TSize.s10,
              children: [
                // Name.
                TextFormFieldWidget(
                  labelText: "Name",
                  controller: widget.nameController,
                  validator: (String? value) => TValidator.validateEmptyText('Name', value),
                ),
                // Email.
                TextFormFieldWidget(
                  labelText: "Email",
                  controller: widget.emailController,
                  validator: (String? value) => TValidator.validateEmail(value),
                ),
                // Password.
                TextFormFieldWidget(
                  labelText: "Password",
                  controller: widget.passwordController,
                  obscureText: true,
                  validator: (String? value) => TValidator.validatePassword(value),
                ),

                // Sign-Up button.
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthLoadingState) {
                      return const SizedBox(
                        width: 100,
                        height: 100,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return ElevatedButton(
                      onPressed: singUp,
                      child: Text("Sign-Up"),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Bloc listener
  void listener(BuildContext context, AuthState state) {
    switch (state) {
      case AuthFailureState():
        THelperFunctions.showToastBar(
          context,
          Text(state.error),
        );
        break;

      case AuthSuccessState():
        // Navigate to home screen
        context.go('/home');
        break;
    }
  }
}
