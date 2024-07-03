import 'package:flutter/material.dart';
import 'package:to_do/screens/accounts/login_screen.dart';
import 'package:to_do/widgets/app_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/icons/welcome.png',
                width: width * 0.4,
                height: height * 0.4,
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: width,
                child: const Center(
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    direction: Axis.vertical,
                    children: [
                      Text(
                        'Task Management &',
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Gilroy-Bold'),
                      ),
                      Text(
                        'To-Do List',
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Gilroy-Bold'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                width: width,
                child: const Center(
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    direction: Axis.vertical,
                    children: [
                      Text(
                        'This productive tool is designed to help',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'you better manage your task',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'project-wise conveniently !',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: AppButton(
          label: "Let's Start",
          fontWeight: FontWeight.w600,
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
        ),
      ),
    );
  }
}
