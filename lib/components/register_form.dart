import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testing/utils/validate_email.dart';

class RegiterForm extends StatefulWidget {
  const RegiterForm({Key? key}) : super(key: key);

  @override
  State<RegiterForm> createState() => _RegiterFormState();
}

class _RegiterFormState extends State<RegiterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isSuccess = false;
  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSuccess = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            key: Key('fieldFirstName'),
            decoration: const InputDecoration(labelText: 'First name'),
            validator: (value) {
              if (value == '') return 'Введите имя';
              return null;
            },
          ),
          TextFormField(
            key: Key('fieldLastNime'),
            decoration: const InputDecoration(labelText: 'Last name'),
            validator: (value) {
              if (value == '') return 'Введите фамилию';
              return null;
            },
          ),
          TextFormField(
            key: Key('fieldPhoneRegister'),
            decoration: const InputDecoration(labelText: 'Phone'),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            validator: (value) {
              if (value == '') return 'Заполните поле телефон';
              return null;
            },
          ),
          TextFormField(
            key: Key('fieldEmailRegister'),
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value == '') return 'Заполните поле email';
              if (!validateEmail(value!)) return 'Email не корректный';
              return null;
            },
          ),
          ElevatedButton(
            onPressed: _handleSubmit,
            child: const Text('Отправить'),
          ),
          if (_isSuccess) const Text('Вы успешно зарегистрировались')
        ],
      ),
    );
  }
}
