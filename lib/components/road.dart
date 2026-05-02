import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../racing_game.dart';

class Road extends SpriteComponent with HasGameRef<RacingGame> {
  double offset = 0;
  static const double roadSpeed = 200;

  Road()
      : super(
          anchor: Anchor.topCenter,
        );

  @override
  void render(Canvas canvas) {
    // Draw main road background
    canvas.drawRect(
      Rect.fromLTWH(
        0,
        0,
        gameRef.size.x,
        gameRef.size.y,
      ),
      Paint()..color = const Color(0xFF333333),
    );

    // Draw road with lane markings
    final paintLaneMarking = Paint()
      ..color = Colors.white
      ..strokeWidth = 2;

    // Vertical center line (dashed)
    double lineY = -offset;
    while (lineY < gameRef.size.y) {
      canvas.drawLine(
        Offset(gameRef.size.x / 2, lineY),
        Offset(gameRef.size.x / 2, lineY + 40),
        paintLaneMarking,
      );
      lineY += 60;
    }

    // Side boundaries
    final paintBoundary = Paint()
      ..color = Colors.white
      ..strokeWidth = 3;

    canvas.drawLine(
      Offset(gameRef.size.x * 0.15, 0),
      Offset(gameRef.size.x * 0.15, gameRef.size.y),
      paintBoundary,
    );

    canvas.drawLine(
      Offset(gameRef.size.x * 0.85, 0),
      Offset(gameRef.size.x * 0.85, gameRef.size.y),
      paintBoundary,
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Update offset untuk efek jalan bergerak
    offset = (offset + roadSpeed * dt) % 60;
  }
}
