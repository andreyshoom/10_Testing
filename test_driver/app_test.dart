// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Login form tests', () {
    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver?.close();
      }
    });
    final textEntry = find.text('Вход');
    final fieldEmailLogin = find.byValueKey('fieldEmailLogin');
    final fieldPhoneLogin = find.byValueKey('fieldPhoneLogin');
    final sendLogin = find.text('Отправить');
    final registerButton = find.byValueKey('Регистрация');

    test('Test entry text', () async {
      expect(await driver?.getText(textEntry), 'Вход');
    });

    test('Test email field', () async {
      await driver?.tap(fieldEmailLogin);
      await driver?.waitFor(find.text(''));
      await driver?.enterText('test@test.com');
      await driver?.waitFor(find.text('test@test.com'));
    });

    test('Test phone field', () async {
      await driver?.tap(fieldPhoneLogin);
      await driver?.waitFor(find.text(''));
      await driver?.enterText('3858208');
      await driver?.waitFor(find.text('3858208'));
    });

    test('Test button Отправить ', () async {
      await driver?.tap(sendLogin);
    });

    test('Welcom test', () async {
      final success = find.text('Добро пожаловать');
      expect(await driver?.getText(success), 'Добро пожаловать');
    });

    test('No account? test', () async {
      final haveAccount = find.text('Еще нет аккаунта?');
      expect(await driver?.getText(haveAccount), 'Еще нет аккаунта?');
    });

    test('Register button', () async {
      await driver?.tap(registerButton);
    });
  });

  group('Rigister form tests', () {
    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver?.close();
      }
    });

    final textRegister = find.text('Регистрация');
    final fieldFirstName = find.byValueKey('fieldFirstName');
    final fieldLastName = find.byValueKey('fieldLastNime');
    final fieldPhoneRegister = find.byValueKey('fieldPhoneRegister');
    final fieldEmailRegister = find.byValueKey('fieldEmailRegister');
    final sendRegister = find.text('Отправить');
    final entryButton = find.byValueKey('Войти');

    test('Test Register text', () async {
      expect(await driver?.getText(textRegister), 'Регистрация');
    });

    test('Test first name field', () async {
      await driver?.tap(fieldFirstName);
      await driver?.waitFor(find.text(''));
      await driver?.enterText('First');
      await driver?.waitFor(find.text('First'));
    });

    test('Test last name field', () async {
      await driver?.tap(fieldLastName);
      await driver?.waitFor(find.text(''));
      await driver?.enterText('Last');
      await driver?.waitFor(find.text('Last'));
    });

    test('Test phone field', () async {
      await driver?.tap(fieldPhoneRegister);
      await driver?.waitFor(find.text(''));
      await driver?.enterText('3858208');
      await driver?.waitFor(find.text('3858208'));
    });

    test('Test email field', () async {
      await driver?.tap(fieldEmailRegister);
      await driver?.waitFor(find.text(''));
      await driver?.enterText('test@test.com');
      await driver?.waitFor(find.text('test@test.com'));
    });

    test('Test button Отправить ', () async {
      await driver?.tap(sendRegister);
    });

    test('Have account? test', () async {
      final noAccount = find.text('Уже есть аккаунт?');
      expect(await driver?.getText(noAccount), 'Уже есть аккаунт?');
    });

    test('Entry button', () async {
      await driver?.tap(entryButton);
    });
  });
}
