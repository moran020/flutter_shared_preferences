import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? _username;
  String? _password;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(245, 104, 61, 1),
        body: Stack(children: [
          Center(
            child: Container(
              height: 440,
              width: 300,
              color: const Color.fromRGBO(235, 235, 235, 1),
              child: Column(
                children: [
                  const SizedBox(
                    height: 45,
                  ),
                  const Text(
                    'Member Login',
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
                        setState(() {
                          getData();
                        });
                      },
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/register',
                      );
                    },
                    child: Text(
                      "Don't have an account? Register!",
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 250,
                    child: (_username != null) & (_password != null)
                        ? Text('${message()}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 25, color: Colors.red))
                        : const Text(''),
                  ),
                ],
              ),
            ),
          ),
          Align(
              alignment: const Alignment(0.0, -0.73),
              child: Container(
                child: const Icon(
                  Icons.person,
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

  Future<String?> getData() async {
    dynamic getStorage = await SharedPreferences.getInstance();
    dynamic getUsername = await getStorage.get('username');
    dynamic getPassword = await getStorage.get('password');
    setState(() {
      _username = getUsername;
      _password = getPassword;
    });
    return null;
  }

  String? message() {
    if ((_username == usernameController.text) &&
        (_password == passwordController.text)) {
      return ('Hello, $_username!');
    } else if ((_username != usernameController.text) |
        (_password != passwordController.text)) {
      return ('The username or password is incorrect');
    }
    return null;
  }
}
