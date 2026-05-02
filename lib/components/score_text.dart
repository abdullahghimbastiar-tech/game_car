import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class ScoreText extends TextComponent {
  int currentScore = 0;

  ScoreText({required Vector2 position})
      : super(
          position: position,
          anchor: Anchor.topLeft,
        );

  void updateScore(int newScore) {
    currentScore = newScore;
    text = 'Score: $currentScore';
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    textRenderer = TextPaint(
      style: const TextStyle(
        color: Colors.white,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
    text = 'Score: 0';
  }
}
