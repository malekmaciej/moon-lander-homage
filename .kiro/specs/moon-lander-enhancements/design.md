# Design Document

## Overview

This design extends the existing Retro Moon Lander game with three key enhancements: a scoring system with bonus pads, celebratory visual feedback for high scores, and continuous gameplay with fuel refills. The implementation maintains the existing game architecture while adding new rendering logic and transforms the game from single-attempt sessions to continuous multi-landing gameplay.

## Architecture

The enhancements follow the existing single-file HTML/JavaScript architecture:

- **Game State Extension**: Add score tracking (current score, high score) to the existing game state
- **Rendering Enhancement**: Add spaceship animation to the draw loop
- **Scoring Logic**: Implement point calculation based on landing pad type
- **Continuous Gameplay**: Modify game state transitions to allow takeoff after landing and refuel on successful landings

## Components and Interfaces

### Scoring System

```javascript
// Extended game state
let score = 0;
let highScore = 0;

// Extended landing pad structure
const landingPads = [
  { x: number, y: number, width: number, height: number, points: 1 },
  { x: number, y: number, width: number, height: number, points: 2 } // bonus pad
];
```

Each landing pad has a points value. Standard pads award 1 point, the bonus pad awards 2 points.

### Spaceship Celebration

```javascript
let spaceshipAnimation = {
  active: boolean,
  x: number,
  y: number,
  vx: number,
  startTime: number
};
```

The spaceship appears when a new high score is achieved, animates across the screen, and disappears after a duration.

### Continuous Gameplay System

The game state machine is modified to support continuous gameplay:

- **'playing'**: Lander is actively flying and can be controlled
- **'landed'**: Lander has successfully landed, fuel is refilled, player can take off again by pressing thrust
- **'crashed'**: Game session ends, requires restart

Key mechanics:
- Successful landing adds 150 fuel units (capped at maximum fuel capacity of 100)
- Player can press thrust keys from landed state to return to playing state
- Only crashes end the game session
- Score accumulates across multiple landings in a single session

## Data Models

### Landing Pad Object (Extended)
- `x`: X-coordinate of pad's left edge
- `y`: Y-coordinate of pad's top edge
- `width`: Width of landing pad
- `height`: Height of landing pad
- `points`: Point value awarded for successful landing (1 or 2)

### Spaceship Animation Object
- `active`: Boolean indicating if animation is currently playing
- `x`: Current X-coordinate of spaceship
- `y`: Y-coordinate of spaceship (fixed)
- `vx`: Horizontal velocity of spaceship
- `startTime`: Timestamp when animation started

## 
Correctness Properties

*A property is a characteristic or behavior that should hold true across all valid executions of a system—essentially, a formal statement about what the system should do. Properties serve as the bridge between human-readable specifications and machine-verifiable correctness guarantees.*

### Property Reflection

After reviewing all testable criteria from the prework, I've identified the following properties that provide unique validation value:

- **Property 1** (Standard pad scoring) - Validates basic scoring mechanic
- **Property 2** (High score update) - Validates score tracking
- **Property 3** (Spaceship trigger) - Validates celebration trigger
- **Property 4** (Spaceship animation) - Validates animation behavior
- **Property 5** (Spaceship lifecycle) - Validates animation cleanup
- **Property 6** (Fuel refill) - Validates continuous gameplay fuel mechanic
- **Property 7** (Takeoff after landing) - Validates continuous gameplay state transitions

### Properties

**Property 1: Standard pad landing awards correct points**

*For any* successful landing on a standard landing pad (points = 1), the score should increase by exactly 1 point.

**Validates: Requirements 1.1**

**Property 2: High score updates correctly**

*For any* score value, when the current score exceeds the high score, the high score should be updated to equal the current score.

**Validates: Requirements 2.1**

**Property 3: New high score triggers spaceship**

*For any* game state where a new high score is achieved, the spaceship animation should become active.

**Validates: Requirements 2.2**

**Property 4: Spaceship animates across screen**

*For any* active spaceship animation, the spaceship's x-coordinate should change over successive frames until the animation completes.

**Validates: Requirements 2.3**

**Property 5: Spaceship animation completes and cleans up**

*For any* spaceship animation, after the animation duration elapses, the spaceship should no longer be active.

**Validates: Requirements 2.5**

**Property 6: Successful landing refuels lander**

*For any* successful landing, the lander's fuel should increase by 150 units (capped at maximum capacity of 100).

**Validates: Requirements 3.1**

**Property 7: Game continues after successful landing**

*For any* successful landing, the game state should allow the player to take off again without requiring a restart.

**Validates: Requirements 3.2**

## Error Handling

### Collision Detection Edge Cases

- **Lander at boundary**: When lander is at screen edges, collision detection should still function correctly
- **Zero-size objects**: Validation should ensure pads have positive dimensions

### Scoring Edge Cases

- **Score overflow**: While unlikely in typical gameplay, score should handle large values gracefully
- **Rapid successive landings**: Multiple landings in quick succession should each award points correctly
- **Landing on bonus pad edge**: Collision detection should work consistently across the entire bonus pad area

### Animation Edge Cases

- **Multiple high scores in quick succession**: If player achieves multiple new high scores rapidly, only one spaceship animation should play at a time
- **Animation during game state changes**: Spaceship animation should continue or stop appropriately if game is restarted during animation

## Testing Strategy

### Unit Testing Approach

Since this is a browser-based game with tightly coupled rendering and game logic, unit testing will focus on:

- **Collision detection functions**: Test bounding box intersection logic with specific examples
- **Scoring logic**: Verify point calculation for standard and bonus pads
- **High score tracking**: Test high score update logic with specific score sequences
- **Animation state management**: Verify spaceship animation state transitions

Example unit tests:
- Landing on bonus pad with score=5 should result in score=7
- Achieving score=10 when highScore=8 should update highScore to 10
- Lander at position (x, y) colliding with mountain at (mx, my, mw, mh) should register crash

### Property-Based Testing Approach

Property-based testing will verify universal behaviors across many randomly generated inputs:

**Testing Framework**: We'll use **fast-check** (JavaScript property-based testing library) to generate random test cases.

**Configuration**: Each property test will run a minimum of 100 iterations to ensure thorough coverage.

**Property Test Tagging**: Each property-based test will include a comment in this format:
```javascript
// Feature: moon-lander-enhancements, Property 1: Mountain collision causes crash
```

**Properties to Test**:

1. **Standard pad scoring** (Property 1)
   - Generate: Random initial scores, random standard pad landings
   - Verify: Score increases by 1 for each standard pad landing

2. **High score updates** (Property 2)
   - Generate: Random score sequences
   - Verify: High score always equals the maximum score achieved

3. **Spaceship trigger** (Property 3)
   - Generate: Random score progressions that include high score achievements
   - Verify: Spaceship activates exactly when new high score is achieved

4. **Spaceship animation** (Property 4)
   - Generate: Random animation states
   - Verify: X-coordinate changes consistently during active animation

5. **Spaceship lifecycle** (Property 5)
   - Generate: Random animation start times
   - Verify: Animation deactivates after specified duration

6. **Fuel refill** (Property 6)
   - Generate: Random fuel levels before landing
   - Verify: Fuel increases by 150 (capped at 100) after landing

7. **Continuous gameplay** (Property 7)
   - Generate: Random game states after landing
   - Verify: Player can take off again from landed state

### Integration Testing

Integration tests will verify the complete feature working together:
- Complete gameplay session with mountains, scoring, and spaceship
- Verify all UI elements update correctly during gameplay
- Test game restart behavior with all new features

### Manual Testing Checklist

Since this is a visual game, manual testing is important for:
- Bonus pad visual distinction from standard pads
- Spaceship animation smoothness and visual appeal
- Congratulatory text readability and timing
- Continuous gameplay feel and takeoff mechanics
- Overall game feel and difficulty balance
