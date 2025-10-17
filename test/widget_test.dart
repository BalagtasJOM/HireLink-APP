import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hirelink/loginpage.dart';
import 'package:hirelink/Homepage.dart';

void main() {
  testWidgets('Login page shows logo and login button', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    expect(find.byType(Image), findsOneWidget);

    expect(find.text('Log in'), findsOneWidget);
  });

  testWidgets('Homepage shows welcome text and navigation bar', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: Homepage()));

    expect(find.text('Welcome to Hirelink'), findsOneWidget);

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Practice'), findsOneWidget);
    expect(find.text('Tracker'), findsOneWidget);
    expect(find.text('Journal'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
  });
}