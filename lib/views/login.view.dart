import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sih_tal/theme/colorPalette.dart';
import 'package:sih_tal/widgets/buttons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _checkedValue = false;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _theme = Theme.of(context);
    return Stack(
      children: [
        GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                width: _size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 100),
                    Text('Team Acute\nLogisticX',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: _theme.textTheme.bodyText1!.color!
                                .withOpacity(0.9),
                            fontSize: 40,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 50),
                    const Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 25),
                    inputField(
                        theme: _theme,
                        label: 'Email',
                        prefixIcon: Icons.email,
                        controller: _emailController,
                        onTap: () {}),
                    const SizedBox(height: 10),
                    inputField(
                        theme: _theme,
                        label: 'Password',
                        prefixIcon: Icons.key,
                        controller: _passwordController,
                        onTap: () {},
                        isPassword: true),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: Checkbox(
                              activeColor: _theme.primaryColor,
                              value: _checkedValue,
                              onChanged: (newValue) {
                                setState(() {
                                  _checkedValue = newValue!;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text('Remember me?'),
                          const Spacer(),
                          TextButton(
                            style: TextButton.styleFrom(
                                primary: _theme.textTheme.bodyText1!.color!
                                    .withOpacity(0.4)),
                            onPressed: () {},
                            child: const Text('Forgot Password?',
                                style:
                                    TextStyle(fontWeight: FontWeight.normal)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    Buttons(_theme).primaryButton(() {}, 'Login'),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: _size.width * 0.3,
                              child: const Divider(thickness: 3)),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text('Or'),
                          ),
                          SizedBox(
                              width: _size.width * 0.3,
                              child: const Divider(thickness: 3)),
                        ],
                      ),
                    ),
                    Buttons(_theme).primaryButton(() {}, 'Sign Up'),
                  ],
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            'assets/images/sih_logo.png',
            height: 65,
            width: 65,
          ),
        ),
      ],
    );
  }

  Padding inputField(
      {required ThemeData theme,
      required String label,
      required IconData prefixIcon,
      required TextEditingController controller,
      required onTap,
      bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: TextField(
        controller: controller,
        onTap: onTap,
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: theme.primaryColor),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: theme.primaryColor.withOpacity(0.3), width: 6.0),
          ),
          labelText: label,
          labelStyle: TextStyle(
              fontSize: 18,
              color: theme.textTheme.bodyText1!.color!.withOpacity(0.5)),
        ),
      ),
    );
  }
}
