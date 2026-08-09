// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:myfinance_tracker/app.dart';
import 'package:myfinance_tracker/providers/settings_provider.dart';
import 'package:myfinance_tracker/providers/auth_provider.dart';
import 'package:myfinance_tracker/providers/category_provider.dart';
import 'package:myfinance_tracker/providers/transaction_provider.dart';
import 'package:myfinance_tracker/providers/budget_savings_debt_providers.dart';
import 'package:myfinance_tracker/providers/debt_provider.dart';
import 'package:myfinance_tracker/providers/sub_category_provider.dart';
import 'package:myfinance_tracker/providers/credit_card_provider.dart';

void main() {
  testWidgets('App loads without crashing', (WidgetTester tester) async {
    // Build our app with all providers and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SettingsProvider()..load()),
          ChangeNotifierProvider(create: (_) => AuthProvider()..init()),
          ChangeNotifierProvider(create: (_) => CategoryProvider()),
          ChangeNotifierProvider(create: (_) => TransactionProvider()),
          ChangeNotifierProvider(create: (_) => BudgetProvider()),
          ChangeNotifierProvider(create: (_) => SavingsProvider()),
          ChangeNotifierProvider(create: (_) => DebtProvider()),
          ChangeNotifierProvider(create: (_) => SubCategoryProvider()),
          ChangeNotifierProvider(create: (_) => CreditCardProvider()),
        ],
        child: const MyApp(),
      ),
    );

    // Wait for async initialization
    await tester.pumpAndSettle();

    // Verify app loads (shows onboarding or login or main screen)
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
