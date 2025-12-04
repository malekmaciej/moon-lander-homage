# Implementation Plan

- [x] 1. Add scoring system and update game state
  - Add score and highScore variables to game state
  - Update landing pads array to include points property (1 for standard, 2 for bonus)
  - Create smaller bonus pad with points: 2
  - Add score and high score display to UI
  - _Requirements: 2.1, 2.2, 2.3, 2.5_

- [x] 1.1 Write property test for standard pad scoring
  - **Property 3: Standard pad landing awards correct points**
  - **Validates: Requirements 2.1**

- [x] 1.2 Write property test for high score tracking
  - **Property 4: High score updates correctly**
  - **Validates: Requirements 3.1**

- [x] 2. Implement continuous gameplay with fuel refills


  - Modify successful landing to add 150 fuel units (capped at 100 max capacity)
  - Change 'landed' state to allow takeoff instead of requiring restart
  - Add input handling to allow thrust from 'landed' state to return to 'playing'
  - Ensure only crashes or zero fuel end the game session
  - Update game over conditions to distinguish between crash and out-of-fuel
  - Update drawLandedScreen to show "Press THRUST to Take Off" message
  - _Requirements: 4.1, 4.2, 4.3, 4.4_

- [x] 2.1 Write property test for fuel refill

  - **Property 8: Successful landing refuels lander**
  - **Validates: Requirements 4.1**

- [x] 2.2 Write property test for continuous gameplay

  - **Property 9: Game continues after successful landing**
  - **Validates: Requirements 4.2**

- [x] 2.3 Write property test for crash ends session

  - **Property 10: Crash ends game session**
  - **Validates: Requirements 4.3**

- [x] 3. Implement spaceship celebration animation


  - Create spaceshipAnimation object to track animation state (active, x, y, vx, startTime)
  - Add function to trigger spaceship when new high score is achieved
  - Implement spaceship rendering (large ship graphic moving across screen)
  - Add congratulatory text display during spaceship animation
  - Use Kiro purple (#790ECB) for spaceship accent colors
  - Ensure spaceship triggers only on NEW high scores (not equal scores)
  - _Requirements: 3.2, 3.3, 3.4_

- [x] 3.1 Write property test for spaceship trigger

  - **Property 5: New high score triggers spaceship**
  - **Validates: Requirements 3.2**

- [x] 3.2 Write property test for spaceship animation

  - **Property 6: Spaceship animates across screen**
  - **Validates: Requirements 3.3**

- [x] 4. Implement spaceship animation lifecycle


  - Add animation duration timer (3-4 seconds recommended)
  - Implement spaceship removal after animation completes
  - Ensure only one spaceship animation plays at a time
  - Update spaceship position in game loop when active
  - _Requirements: 3.5_

- [x] 4.1 Write property test for spaceship lifecycle

  - **Property 7: Spaceship animation completes and cleans up**
  - **Validates: Requirements 3.5**

- [x] 5. Visual polish and bonus pad distinction


  - Ensure bonus pad has visual distinction (already purple vs orange)
  - Ensure bonus pad is visibly smaller than standard pads (already 50px vs 80-100px)
  - Add visual feedback when landing on bonus pad (text popup showing "+2 BONUS!")
  - Add glow effect or pulsing animation to bonus pad
  - _Requirements: 2.3, 2.4_

- [x] 6. Update game restart logic


  - Reset score to 0 on restart (keep high score)
  - Stop any active spaceship animation on restart
  - Ensure restart only happens from 'crashed' state, not 'landed' state
  - _Requirements: 4.5_

- [x] 7. Add out-of-fuel game over state

  - Check if fuel reaches zero during 'playing' state
  - Create 'out_of_fuel' game state
  - Add drawOutOfFuelScreen with appropriate message
  - Ensure out-of-fuel state requires restart like crash
  - _Requirements: 4.4_

- [x] 8. Final checkpoint - Ensure all tests pass



  - Run all property-based tests
  - Verify continuous gameplay works correctly
  - Verify spaceship animation triggers and completes
  - Verify visual polish is applied
  - Ask the user if questions arise

