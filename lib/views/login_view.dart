import 'package:flutter/material.dart';
import 'package:testing/components/login_form.dart';
import 'package:testing/components/register_form.dart';

enum FormType { login, register }

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  FormType _formType = FormType.login;

  _switchForm() {
    setState(() {
      _formType =
          _formType == FormType.login ? FormType.register : FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _formType == FormType.login ? 'Вход' : 'Регистрация',
                          style: Theme.of(context).textTheme.headline4,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      _formType == FormType.login ? LoginForm() : RegiterForm(),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _formType == FormType.login
                          ? 'Еще нет аккаунта?'
                          : 'Уже есть аккаунт?',
                      key: Key(_formType == FormType.login
                          ? 'Еще нет аккаунта?'
                          : 'Уже есть аккаунт?'),
                    ),
                    ElevatedButton(
                      key: Key(
                        _formType == FormType.login ? 'Регистрация' : 'Войти',
                      ),
                      onPressed: _switchForm,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: _formType == FormType.login
                                  ? 'Регистрация'
                                  : 'Войти',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
