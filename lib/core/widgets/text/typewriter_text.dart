import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio/core/widgets/text/app_text.dart';

class TypewriterText extends StatefulWidget {
  final List<String> phrases;
  final TextStyle? style;
  final Duration charDelay;
  final Duration pauseAfterTyping;
  final Duration pauseAfterDeleting;
  final Duration cursorBlinkDuration;
  final String cursorChar;
  final bool loop;

  const TypewriterText({
    super.key,
    required this.phrases,
    this.style,
    this.charDelay = const Duration(milliseconds: 80),
    this.pauseAfterTyping = const Duration(milliseconds: 900),
    this.pauseAfterDeleting = const Duration(milliseconds: 400),
    this.cursorBlinkDuration = const Duration(milliseconds: 500),
    this.cursorChar = '|',
    this.loop = true,
  });

  @override
  State<TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> {
  Timer? _typeTimer;
  Timer? _cursorTimer;

  String _display = '';
  int _phraseIndex = 0;
  int _charIndex = 0;
  bool _deleting = false;
  bool _cursorVisible = true;

  // internal pause counter (in ticks) to avoid awaiting inside timer callback
  int _pauseTicksRemaining = 0;

  @override
  void initState() {
    super.initState();
    _startCursorTimer();
    _startTypeTimer();
  }

  void _startCursorTimer() {
    _cursorTimer?.cancel();
    _cursorTimer = Timer.periodic(widget.cursorBlinkDuration, (_) {
      if (!mounted) return;
      setState(() => _cursorVisible = !_cursorVisible);
    });
  }

  void _startTypeTimer() {
    _typeTimer?.cancel();
    _typeTimer = Timer.periodic(widget.charDelay, (_) {
      if (!mounted) return;

      // if currently in a pause, decrement and return
      if (_pauseTicksRemaining > 0) {
        _pauseTicksRemaining--;
        return;
      }

      final current = widget.phrases[_phraseIndex];

      if (!_deleting) {
        // typing
        if (_charIndex < current.length) {
          _charIndex++;
          setState(() => _display = current.substring(0, _charIndex));
        } else {
          // finished typing -> set pause ticks then switch to deleting
          _pauseTicksRemaining =
              (widget.pauseAfterTyping.inMilliseconds ~/
                      widget.charDelay.inMilliseconds)
                  .clamp(1, 100000);
          _deleting = true;
        }
      } else {
        // deleting
        if (_charIndex > 0) {
          _charIndex--;
          setState(() => _display = current.substring(0, _charIndex));
        } else {
          // finished deleting -> set pause ticks then move to next phrase
          _pauseTicksRemaining =
              (widget.pauseAfterDeleting.inMilliseconds ~/
                      widget.charDelay.inMilliseconds)
                  .clamp(1, 100000);
          _deleting = false;
          _phraseIndex = (_phraseIndex + 1) % widget.phrases.length;
          if (!widget.loop && _phraseIndex == 0) {
            // stop timers safely if not looping
            _cancelTimers();
          }
        }
      }
    });
  }

  void _cancelTimers() {
    _typeTimer?.cancel();
    _typeTimer = null;
    _cursorTimer?.cancel();
    _cursorTimer = null;
  }

  @override
  void dispose() {
    _cancelTimers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textWithCursor =
        _display + (_cursorVisible ? widget.cursorChar : ' ');
    return AppText(
      text: textWithCursor,
      style: widget.style ?? DefaultTextStyle.of(context).style,
    );
  }
}
