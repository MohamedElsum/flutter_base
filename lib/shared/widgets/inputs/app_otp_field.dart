import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppOtpField extends StatefulWidget {
  final int length;
  final ValueChanged<String>? onCompleted;

  const AppOtpField({
    super.key,
    this.length = 6,
    this.onCompleted,
  });

  @override
  State<AppOtpField> createState() => _AppOtpFieldState();
}

class _AppOtpFieldState extends State<AppOtpField> {
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty && index < widget.length - 1) {
      _focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }

    final otp = _controllers.map((c) => c.text).join();
    if (otp.length == widget.length) {
      widget.onCompleted?.call(otp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      children: List.generate(
        widget.length,
        (index) => Container(
          width: 48,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: TextFormField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            textAlign: .center,
            maxLength: 1,
            keyboardType: .number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(counterText: ''),
            onChanged: (value) => _onChanged(value, index),
          ),
        ),
      ),
    );
  }
}
