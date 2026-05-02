# Racing Game - Flutter Project Instructions

## Project Overview
A simple endless racing game built with Flutter and Flame 2D engine. Players control a car to avoid obstacles spawning from the top of the screen.

## Project Setup Status
- ✅ Flutter project scaffolded with Flame dependency
- ✅ Game components created (Player, Obstacle, Road, Score system)
- ✅ Collision detection system implemented
- ✅ Game loop and physics integrated

## Key Features Implemented
1. **Player Control**: Tap or use arrow keys to move left/right
2. **Obstacle Spawning**: Auto-spawn of obstacles every 2 seconds in random lanes
3. **Collision System**: Real-time collision detection with game over handling
4. **Score System**: Score increments over time based on survival duration
5. **Game Reset**: Full game state reset on game over
6. **Road Parallax**: Animated road with lane markings

## How to Run
```bash
flutter pub get
flutter run
```

## Development Guidelines
- Use Flame components for game objects (extends SpriteComponent)
- Implement collision detection with HasCollisionDetection mixin
- Update game state in the update() method
- Use render() for custom graphics drawing
- Keep physics and logic in components for modularity

## File Structure
```
lib/
├── main.dart
├── racing_game.dart
└── components/
    ├── player.dart
    ├── obstacle.dart
    ├── road.dart
    └── score_text.dart
```

## Next Steps for Enhancement
1. Add sprite assets and animations
2. Implement sound effects (flame_audio)
3. Add progressive difficulty levels
4. Create main menu and pause screen overlays
5. Implement power-ups and special items
6. Add particle effects for collisions

## Dependencies
- `flame: ^1.18.0` - 2D Game Engine
- `flutter: sdk: flutter` - UI Framework

---

For detailed information, see [README.md](../README.md)
