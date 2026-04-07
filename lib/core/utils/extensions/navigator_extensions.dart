import 'package:flutter/material.dart';

extension NavigatorExtensions on BuildContext {
  Future<T?> push<T>(Widget page) =>
      Navigator.of(this).push<T>(MaterialPageRoute(builder: (_) => page));

  Future<T?> pushReplacement<T, TO>(Widget page) =>
      Navigator.of(this).pushReplacement<T, TO>(MaterialPageRoute(builder: (_) => page));

  void pop<T>([T? result]) => Navigator.of(this).pop(result);

  void popUntilFirst() => Navigator.of(this).popUntil((route) => route.isFirst);

  Future<T?> pushAndRemoveAll<T>(Widget page) =>
      Navigator.of(this).pushAndRemoveUntil<T>(
        MaterialPageRoute(builder: (_) => page),
        (_) => false,
      );

  bool get canPop => Navigator.of(this).canPop();
}
