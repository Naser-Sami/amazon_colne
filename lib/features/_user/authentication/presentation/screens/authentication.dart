import 'package:flutter/material.dart';

import '/core/_core.dart';
import '/config/_config.dart';
import '../widgets/_widgets.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  Auth _auth = Auth.register;
  final _singUpFormKey = GlobalKey<FormState>();
  final _singInFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(TPadding.p08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: TPadding.p08),
                child: Text(
                  'Welcome',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),

              // ---
              // Sign-Up.
              AuthListTile(
                title: "Create Account",
                value: Auth.register,
                groupValue: _auth,
                onChanged: (Object? val) {
                  setState(() {
                    if (val != null) {
                      _auth = val as Auth;
                    }
                  });
                },
              ),

              // Sign-Up, Form.
              if (_auth == Auth.register)
                SignUpForm(
                  singUpFormKey: _singUpFormKey,
                  nameController: _nameController,
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),

              // ---
              // Sign-In.
              AuthListTile(
                title: "Sign-In.",
                value: Auth.login,
                groupValue: _auth,
                onChanged: (Object? val) {
                  setState(() {
                    if (val != null) {
                      _auth = val as Auth;
                    }
                  });
                },
              ),

              // Sign-In, Form.
              if (_auth == Auth.login)
                SignInForm(
                  singInFormKey: _singInFormKey,
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
