import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:to_do/screens/accounts/login_screen.dart';
import 'package:to_do/widgets/app_button.dart';
import 'package:to_do/widgets/text_form.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //logo of login page
              Image.asset(
                'assets/icons/welcome.png',
                width: 150.0,
                height: 150.0,
              ),
              const SizedBox(
                height: 5.0,
              ),
              //login text
              Container(
                padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                child: const Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Gilroy-Bold'),
                ),
              ),
              //Name field

              const CustomTextField(
                labelText: 'Name',
                inputType: TextInputType.name,
                obscureText: false,
              ),
              const SizedBox(
                height: 10.0,
              ),
              //phone text field
              Container(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
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
              //Years of experience field
              const CustomTextField(
                labelText: 'Years of experience...',
                inputType: TextInputType.number,
                obscureText: false,
              ),
              const SizedBox(
                height: 10.0,
              ),
              //choose  experience level field
              const DropdownMenuL(
                list: ['Trainee', 'Junior', 'Middle', 'Senior'],
              ),
              const SizedBox(
                height: 10.0,
              ),
              //address field
              const CustomTextField(
                labelText: 'Address...',
                inputType: TextInputType.text,
                obscureText: false,
              ),
              const SizedBox(
                height: 10.0,
              ),
              //password field
              const CustomTextField(
                labelText: 'Password...',
                inputType: TextInputType.text,
                obscureText: true,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 0.0),
                child: const AppButton(
                  label: 'Sign up',
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: const Text('Already have any account ? '),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    child: const Text(
                      'Sign in',
                      style: TextStyle(decoration: TextDecoration.underline),
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
