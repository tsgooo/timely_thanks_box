import 'package:flutter/material.dart';

class DynamicText extends StatefulWidget {
  final String text;

  const DynamicText({super.key, required this.text});

  @override
  _DynamicTextState createState() => _DynamicTextState();
}

class _DynamicTextState extends State<DynamicText> {
  late TextPainter _textPainter;
  double _availableWidth = 0;
  bool _isEllipsized = false;

  @override
  void initState() {
    super.initState();
    _textPainter = TextPainter(
      text: TextSpan(text: widget.text, style: const TextStyle(fontSize: 16)),
      textDirection: TextDirection.ltr,
      maxLines: null,
      ellipsis: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (_availableWidth != constraints.maxWidth) {
          _availableWidth = constraints.maxWidth;
          _textPainter.layout(maxWidth: _availableWidth);
          setState(() {
            _isEllipsized = _textPainter.didExceedMaxLines;
          });
        }

        return Text(
          widget.text,
          style: const TextStyle(fontSize: 16),
          maxLines: null,
          overflow: _isEllipsized ? TextOverflow.ellipsis : null,
        );
      },
    );
  }
}
