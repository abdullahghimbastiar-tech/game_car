import 'dart:math';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/player.dart';
import 'components/obstacle.dart';
import 'components/road.dart';
import 'components/score_text.dart';

class RacingGame extends FlameGame
    with TapCallbacks, HasCollisionDetection, KeyboardEvents {
  late Player player;
  late ScoreText scoreText;
  int score = 0;
  double spawnTimer = 0;
  double spawnInterval = 2.0; // Spawn obstacle setiap 2 detik
  bool isGameOver = false;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    camera.viewfinder.anchor = Anchor.center;

    // Tambahkan latar belakang jalan
    add(Road());

    // Tambahkan pemain (mobil)
    player = Player();
    add(player);

    // Tambahkan score text
    scoreText = ScoreText(position: Vector2(20, 20));
    add(scoreText);
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (isGameOver) return;

    // Spawn obstacles
    spawnTimer += dt;
    if (spawnTimer >= spawnInterval) {
      spawnTimer = 0;
      spawnObstacle();
    }

    // Update score berdasarkan waktu bertahan
    score = (score + (dt * 10).toInt()).toInt();
    scoreText.updateScore(score);

    // Hapus obstacles yang keluar dari layar
    children.whereType<Obstacle>().forEach((obstacle) {
      if (obstacle.position.y > size.y + 100) {
        obstacle.removeFromParent();
      }
    });
  }

  void spawnObstacle() {
    final random = Random();
    final lanes = [
      size.x * 0.3,
      size.x * 0.5,
      size.x * 0.7,
    ];

    final randomLane = lanes[random.nextInt(lanes.length)];
    final obstacle = Obstacle(position: Vector2(randomLane, -50));
    add(obstacle);
  }

  @override
  void onTapDown(TapDownEvent event) {
    if (isGameOver) {
      resetGame();
      return;
    }

    // Logika berpindah jalur
    if (event.localPosition.x < size.x / 2) {
      player.moveLeft();
    } else {
      player.moveRight();
    }
  }

  @override
  KeyEventResult onKeyEvent(
    RawKeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    if (isGameOver && event.isKeyPressed(LogicalKeyboardKey.space)) {
      resetGame();
      return KeyEventResult.handled;
    }

    if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
      player.moveLeft();
      return KeyEventResult.handled;
    }

    if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
      player.moveRight();
      return KeyEventResult.handled;
    }

    return KeyEventResult.ignored;
  }

  void gameOver() {
    isGameOver = true;
    add(
      TextComponent(
        text: 'GAME OVER\nScore: $score\nTap to restart',
        textRenderer: TextPaint(
          style: const TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        anchor: Anchor.center,
        position: size / 2,
      ),
    );
  }

  void resetGame() {
    isGameOver = false;
    score = 0;
    spawnTimer = 0;

    // Hapus semua obstacles
    children.whereType<Obstacle>().forEach((obstacle) {
      obstacle.removeFromParent();
    });

    // Reset pemain
    player.resetPosition();

    // Hapus game over text
    children.whereType<TextComponent>().forEach((text) {
      text.removeFromParent();
    });
  }
}
