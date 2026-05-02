import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../racing_game.dart';

class Obstacle extends SpriteComponent
    with HasGameRef<RacingGame>, CollisionCallbacks {
  static const double speed = 250;

  Obstacle({required Vector2 position})
      : super(
          size: Vector2(50, 80),
          position: position,
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    super.onLoad();

    // Tambahkan circular hitbox untuk collision detection
    add(
      CircleHitbox(
        radius: 25,
        anchor: Anchor.center,
      ),
    );
  }

  @override
  void render(Canvas canvas) {
    // Draw simple obstacle/enemy car shape
    canvas.drawRect(
      Rect.fromLTWH(-width / 2, -height / 2, width, height),
      Paint()..color = Colors.yellow,
    );

    // Draw windows
    canvas.drawRect(
      Rect.fromLTWH(-width / 3, -height / 3, width * 0.66, height * 0.5),
      Paint()..color = Colors.purple,
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Gerak obstacle dari atas ke bawah
    position.y += speed * dt;
  }
}
