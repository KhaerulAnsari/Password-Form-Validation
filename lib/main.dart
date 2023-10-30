import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PasswordValidateForm(),
    );
  }
}

class PasswordValidateForm extends StatefulWidget {
  const PasswordValidateForm({super.key});

  @override
  State<PasswordValidateForm> createState() => _PasswordValidateFormState();
}

class _PasswordValidateFormState extends State<PasswordValidateForm> {
  bool _isVisible = false;
  bool _isPasswordEightCharacters = false;
  bool _hasPasswordOneNumber = false;
  bool _hasPasswordOneCharacters = false;
  final _formKey = GlobalKey<FormState>();

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');
    final specialRegex = RegExp(r'[.,@#$&*_]');

    setState(() {
      _isPasswordEightCharacters = false;
      if (password.length > 8) {
        _isPasswordEightCharacters = true;
      }

      _hasPasswordOneNumber = false;
      if (numericRegex.hasMatch(password)) {
        _hasPasswordOneNumber = true;
      }

      _hasPasswordOneCharacters = false;
      if (specialRegex.hasMatch(password)) {
        _hasPasswordOneCharacters = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Create Your Account',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Set a Password',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Please create a secure password including the following criteria below.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                validator: (email) {
                  if (email!.isEmpty) {
                    return 'Email is required';
                  } else if (!EmailValidator.validate(email)) {
                    return 'Email format not supported';
                  }

                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    borderSide: BorderSide(
                      color: Colors.blue.shade300,
                    ),
                  ),
                  hintText: 'Email',
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              TextFormField(
                validator: (password) {
                  if (password!.isEmpty) {
                    return 'Password is required';
                  } else if (_isPasswordEightCharacters == false ||
                      _hasPasswordOneNumber == false ||
                      _hasPasswordOneCharacters == false) {
                        return 'Please follow the format below';
                      }

                  return null;
                },
                onChanged: (password) => onPasswordChanged(password),
                obscureText: !_isVisible,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isVisible = !_isVisible;
                      });
                    },
                    icon: _isVisible
                        ? Icon(
                            Icons.visibility,
                            color: Colors.blue.shade300,
                          )
                        : const Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    borderSide: BorderSide(
                      color: Colors.blue.shade300,
                    ),
                  ),
                  hintText: 'Password',
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: _isPasswordEightCharacters
                          ? Colors.green
                          : Colors.transparent,
                      border: _isPasswordEightCharacters
                          ? Border.all(
                              color: Colors.transparent,
                            )
                          : Border.all(
                              color: Colors.grey.shade400,
                            ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Contains at least 8 characters',
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: _hasPasswordOneNumber
                          ? Colors.green
                          : Colors.transparent,
                      border: _hasPasswordOneNumber
                          ? Border.all(
                              color: Colors.transparent,
                            )
                          : Border.all(
                              color: Colors.grey.shade400,
                            ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Contains at least 1 number',
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: _hasPasswordOneCharacters
                          ? Colors.green
                          : Colors.transparent,
                      border: _hasPasswordOneCharacters
                          ? Border.all(
                              color: Colors.transparent,
                            )
                          : Border.all(
                              color: Colors.grey.shade400,
                            ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Contains at least 1 characters',
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              MaterialButton(
                elevation: 0,
                color: Colors.blue.shade300,
                height: 50,
                minWidth: double.infinity,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    return;
                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Create Account',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
