
import 'package:flutter/material.dart';


class Join extends StatefulWidget {
  const Join({super.key, required this.title});

  final String title;

  @override
  State<Join> createState() => _JoinState();
}

class _JoinState extends State<Join> {
  final _formKey = GlobalKey<FormState>();

  String? _firstName;
  String? _lastName;
  String? _email;
  String? _emailVerification;
  String? _username;
  String? _password;
  String? _passwordVerification;

  String get title => 'Join the Travlore Adventure';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: const Color(0xFF2A2D3B),
    appBar: AppBar(
      title: Text(title),

    ),  
    body:Form(key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0), // add padding here
            child: TextFormField(
              style: const TextStyle(color: Colors.white54),
              decoration: const InputDecoration(
                labelText: 'First Name',
                  labelStyle: TextStyle(color: Colors.white),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your first name';
                }
                return null;
              },
              onSaved: (value) => _firstName = value,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0), // add padding here
            child: TextFormField(
              style: const TextStyle(color: Colors.white54),
              decoration: const InputDecoration(labelText: 'Last Name',
                labelStyle: TextStyle(color: Colors.white),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your last name';
                }
                return null;
              },
              onSaved: (value) => _lastName = value,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0), // add padding here
            child: TextFormField(
              style: const TextStyle(color: Colors.white54),
              decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              onSaved: (value) => _email = value,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0), // add padding here
            child: TextFormField(
              style: const TextStyle(color: Colors.white54),
              decoration: const InputDecoration(labelText: 'Email Verification',
                  labelStyle: TextStyle(color: Colors.white),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email verification';
                }
                if (value != _email) {
                  return 'Email verification does not match';
                }
                return null;
              },
              onSaved: (value) => _emailVerification = value,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0), // add padding here
            child: TextFormField(
              style: const TextStyle(color: Colors.white54),
              decoration: const InputDecoration(labelText: 'Username',
                labelStyle: TextStyle(color: Colors.white),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
              onSaved: (value) => _username = value,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0), // add padding here
            child: TextFormField(
              style: const TextStyle(color: Colors.white54),
              decoration: const InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              onSaved: (value) => _password = value,
              obscureText: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0), // add padding here
            child: TextFormField(
              style: const TextStyle(color: Colors.white54),
              decoration: const InputDecoration(
                  labelText: 'Password Verification',
                  labelStyle: TextStyle(color: Colors.white),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password verification';
                }
                if (value != _password) {
                  return 'Password verification does not match';
                }
                return null;
              },
              onSaved: (value) => _passwordVerification = value,
              obscureText: true,
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0), // add padding here
            child: TextFormField(
              style: const TextStyle(color: Colors.white54),
              decoration: const InputDecoration(
                  labelText: 'Password Verification',
                  labelStyle: TextStyle(color: Colors.white),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password verification';
                }
                if (value != _password) {
                  return 'Password verification does not match';
                }
                return null;
              },
              onSaved: (value) => _passwordVerification = value,
              obscureText: true,
            ),
          ),

          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // Here you can call your registration function with the collected data
                print('First Name: $_firstName');
                print('Last Name: $_lastName');
                print('Email: $_email');
                print('Email Verification: $_emailVerification');
                print('Username: $_username');
                print('Password: $_password');
                print('Password Verification: $_passwordVerification');
              }
            },
            child: const Text('Join'),
          ),
        ],
      ),
    )

    );
  }
}
