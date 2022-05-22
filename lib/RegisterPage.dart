import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void saveDataUser() async {
    dynamic saveName = await SharedPreferences.getInstance();
    dynamic savePassword = await SharedPreferences.getInstance();
    await saveName.setString('username', usernameController.text.toString());
    await savePassword.setString(
        'password', passwordController.text.toString());
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(0, 206, 185, 1),
        body: Stack(children: [
          Center(
            child: Container(
              height: 420,
              width: 300,
              color: const Color.fromRGBO(235, 235, 235, 1),
              child: Column(
                children: [
                  const SizedBox(
                    height: 45,
                  ),
                  const Text(
                    'Register',
                    style: TextStyle(
                        fontSize: 30, color: Color.fromRGBO(150, 150, 150, 1)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                      width: 250,
                      child: TextField(
                        controller: usernameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                          hintText: 'Enter your username',
                        ),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                      width: 250,
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter secure password',
                        ),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 250,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: TextButton(
                      onPressed: () {
                        saveDataUser();
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'REGISTER',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
              alignment: const Alignment(0.0, -0.7),
              child: Container(
                child: const Icon(
                  Icons.edit,
                  size: 50,
                ),
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(248, 213, 1, 1),
                  shape: BoxShape.circle,
                ),
              )),
        ]));
  }
}
