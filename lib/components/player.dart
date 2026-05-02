import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../racing_game.dart';
import 'obstacle.dart';

class Player extends SpriteComponent
    with HasGameRef<RacingGame>, CollisionCallbacks {
  static const double baseSpeed = 150;

  Player()
      : super(
          size: Vector2(50, 80),
          anchor: Anchor.center,
        );

  double originalX = 0;
  double targetX = 0;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    // Buat simple rect untuk mobil (placeholder jika tidak ada sprite)
    position = Vector2(gameRef.size.x / 2, gameRef.size.y - 100);
    originalX = position.x;
    targetX = position.x;

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
    // Draw simple car shape
    canvas.drawRect(
      Rect.fromLTWH(-width / 2, -height / 2, width, height),
      Paint()..color = Colors.red,
    );

    // Draw windows
    canvas.drawRect(
      Rect.fromLTWH(-width / 3, -height / 3, width * 0.66, height * 0.5),
      Paint()..color = Colors.blue,
    );
  }

  void moveLeft() {
    if (position.x > width / 2) {
      targetX = (position.x - 100).clamp(width / 2, gameRef.size.x - width / 2);
    }
  }

  void moveRight() {
    if (position.x < gameRef.size.x - width / 2) {
      targetX = (position.x + 100).clamp(width / 2, gameRef.size.x - width / 2);
    }
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Smooth movement ke target
    if ((position.x - targetX).abs() > 1) {
      position.x += (targetX - position.x) * 10 * dt;
    } else {
      position.x = targetX;
    }
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is Obstacle) {
      gameRef.gameOver();
    }
  }

  void resetPosition() {
    position = Vector2(gameRef.size.x / 2, gameRef.size.y - 100);
    originalX = position.x;
    targetX = position.x;
  }
}
