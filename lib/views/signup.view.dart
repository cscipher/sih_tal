import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sih_tal/utils/buttons.dart';
import 'package:sih_tal/utils/misc.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late Misc misc;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    misc = Misc(context);
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onTap: (() => FocusScope.of(context).unfocus()),
        child: SingleChildScrollView(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieBuilder.network(
                'https://assets5.lottiefiles.com/packages/lf20_mjlh3hcy.json',
                height: _size.height * 0.25,
                repeat: true,
              ),
              const SizedBox(height: 40),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Text(
                        'Create Account',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      misc.inputField(
                          label: 'Name',
                          prefixIcon: Icons.person,
                          controller: _nameController,
                          validatorFn: (String? x) {}),
                      const SizedBox(
                        height: 5,
                      ),
                      misc.inputField(
                          label: 'Email',
                          prefixIcon: Icons.email,
                          controller: _emailController,
                          validatorFn: (String? x) {}),
                      const SizedBox(
                        height: 5,
                      ),
                      misc.inputField(
                          label: 'Phone',
                          prefixIcon: Icons.phone,
                          controller: _phoneController,
                          validatorFn: (String? x) {}),
                      const SizedBox(
                        height: 5,
                      ),
                      misc.inputField(
                          label: 'Password',
                          prefixIcon: Icons.lock,
                          controller: _passwordController,
                          validatorFn: (String? x) {}),
                      const SizedBox(
                        height: 5,
                      ),
                      misc.inputField(
                          label: 'Confirm Password',
                          prefixIcon: Icons.lock,
                          controller: _confirmPasswordController,
                          validatorFn: (String? x) {},
                          isPassword: true),
                      const SizedBox(
                        height: 20,
                      ),
                      Buttons(Theme.of(context))
                          .primaryButton(() {}, 'Sign Up'),
                          const Padding(padding: EdgeInsets.all(5), child: Text('data'),)
                    ],
                  ))
            ],
          )),
        ),
      ),
    );
  }
}
