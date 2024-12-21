import 'package:amazon_clone/features/_features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '/core/_core.dart';
import '/config/_config.dart';

class SignInForm extends StatefulWidget {
  final GlobalKey<FormState> singInFormKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignInForm(
      {super.key,
      required this.singInFormKey,
      required this.emailController,
      required this.passwordController});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  // Sing in function
  void singIn() {
    // check if fields are valid
    if (widget.singInFormKey.currentState!.validate()) {
      // sing in event
      context.read<AuthBloc>().add(LoginEvent(
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
            key: widget.singInFormKey,
            child: Column(
              spacing: TSize.s10,
              children: [
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

                // Sign-In button.
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
                      onPressed: singIn,
                      child: Text("Sign-In."),
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
