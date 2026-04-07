import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  Widget paddingAll(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);

  Widget paddingSymmetric({double horizontal = 0, double vertical = 0}) =>
      Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: this,
      );

  Widget paddingOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) =>
      Padding(
        padding: EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
        child: this,
      );

  Widget get center => Center(child: this);

  Widget get expanded => Expanded(child: this);

  Widget flexible({int flex = 1}) => Flexible(flex: flex, child: this);

  Widget onTap(VoidCallback onTap) =>
      GestureDetector(onTap: onTap, child: this);

  Widget visible(bool condition) =>
      Visibility(visible: condition, child: this);

  Widget opacity(double value) => Opacity(opacity: value, child: this);

  Widget get safeArea => SafeArea(child: this);

  Widget sizedBox({double? width, double? height}) =>
      SizedBox(width: width, height: height, child: this);

  Widget align(Alignment alignment) =>
      Align(alignment: alignment, child: this);

  Widget decorated({
    Color? color,
    BorderRadius? borderRadius,
    BoxBorder? border,
    List<BoxShadow>? boxShadow,
  }) =>
      DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
          border: border,
          boxShadow: boxShadow,
        ),
        child: this,
      );

  Widget hero(String tag) => Hero(tag: tag, child: this);
}
