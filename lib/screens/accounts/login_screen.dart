import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:to_do/screens/accounts/sign_up.dart';
import 'package:to_do/screens/home/home_screen.dart';
import 'package:to_do/widgets/app_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //logo of login page
              Image.asset(
                'assets/icons/welcome.png',
                width: 200.0,
                height: 200.0,
              ),
              const SizedBox(
                height: 20,
              ),
              //login text
              Container(
                padding: const EdgeInsets.all(20.0),
                child: const Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Gilroy-Bold'),
                ),
              ),
              //phone text field
              Container(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                child: IntlPhoneField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: 'Phone Number',
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  initialCountryCode: 'IQ',
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                ),
              ),
              //password field
              Container(
                padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    labelText: 'password',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.deepPurple,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0.0),
                child: AppButton(
                  label: 'Sign In',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(30.0, 10.0, 0.0, 0.0),
                    child: const Text('Didn’t have any account ?'),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()),
                        );
                      },
                      child: const Text(
                        'Sign Up here',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
