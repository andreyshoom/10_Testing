// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/views/login_view.dart';

void main() {
  group(
    'Login view tests',
    () {
      testWidgets(
        "---passing tests for the LOGIN VIEW screen---",
        (WidgetTester tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: LoginView(),
              localizationsDelegates: const [
                DefaultMaterialLocalizations.delegate,
                DefaultWidgetsLocalizations.delegate,
              ],
            ),
          );

          expect(find.text('Вход'), findsOneWidget);
          expect(find.byKey(Key('fieldEmailLogin')), findsOneWidget);
          expect(find.byKey(Key('fieldPhoneLogin')), findsOneWidget);
          expect(find.text('Отправить'), findsOneWidget);

          await tester.enterText(
              find.byKey(Key('fieldEmailLogin')), 'test@test.com');
          expect(find.text('test@test.com'), findsOneWidget);

          await tester.enterText(
              find.byKey(Key('fieldPhoneLogin')), '375293858208');
          expect(find.text('375293858208'), findsOneWidget);

          await tester.tap(find.text('Отправить'));
          await tester.pump();
          expect(find.text('Добро пожаловать'), findsOneWidget);

          expect(find.byKey(Key('Еще нет аккаунта?')), findsOneWidget);
          expect(find.byKey(Key('Регистрация')), findsOneWidget);
          await tester.tap(find.byKey(Key('Регистрация')));
          await tester.pump();

          expect(find.text('Регистрация'), findsOneWidget);
          expect(find.byKey(Key('fieldFirstName')), findsOneWidget);
          expect(find.byKey(Key('fieldLastNime')), findsOneWidget);
          expect(find.byKey(Key('fieldPhoneRegister')), findsOneWidget);
          expect(find.byKey(Key('fieldEmailRegister')), findsOneWidget);
          expect(find.text('Отправить'), findsOneWidget);

          await tester.enterText(find.byKey(Key('fieldFirstName')), 'Name');
          expect(find.text('Name'), findsOneWidget);

          await tester.enterText(find.byKey(Key('fieldLastNime')), 'LastName');
          expect(find.text('LastName'), findsOneWidget);

          await tester.enterText(
              find.byKey(Key('fieldPhoneRegister')), '375293858208');
          expect(find.text('375293858208'), findsOneWidget);

          await tester.enterText(
              find.byKey(Key('fieldEmailRegister')), 'test@test.com');
          expect(find.text('test@test.com'), findsOneWidget);

          await tester.tap(find.text('Отправить'));
          await tester.pump();
          expect(find.text('Вы успешно зарегистрировались'), findsOneWidget);
          expect(find.byKey(Key('Уже есть аккаунт?')), findsOneWidget);
          expect(find.byKey(Key('Войти')), findsOneWidget);
          await tester.tap(find.byKey(Key('Войти')));
          await tester.pump();
        },
      );
    },
  );
}
