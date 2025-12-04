# Requirements Document

## Introduction

This feature enhances the existing Retro Moon Lander game by adding terrain obstacles (mountains), a scoring system with bonus landing pads, and a celebratory spaceship that appears for new high scores. These additions increase gameplay difficulty and provide more engaging feedback for player achievements.

## Glossary

- **Lander**: The player-controlled spacecraft attempting to land on the moon surface
- **Landing Pad**: A designated safe landing zone on the moon surface
- **Mountain**: A terrain obstacle that causes a crash if the Lander collides with it
- **Bonus Pad**: A smaller landing pad that awards double points when successfully landed upon
- **High Score**: The maximum score achieved by the player during the current session
- **Spaceship**: A large visual element that appears to celebrate new high score achievements
- **Score**: Points accumulated by successful landings (1 point for standard pads, 2 points for bonus pad)

## Requirements

### Requirement 1

**User Story:** As a player, I want a scoring system with a bonus landing pad, so that I can challenge myself to achieve higher scores through more difficult landings.

#### Acceptance Criteria

1. WHEN the player successfully lands on a standard Landing Pad THEN the system SHALL award 1 point and update the score display
2. WHEN the player successfully lands on the Bonus Pad THEN the system SHALL award 2 points and update the score display
3. WHEN the Bonus Pad is rendered THEN the system SHALL display it with a smaller width than standard pads
4. WHEN the Bonus Pad is rendered THEN the system SHALL visually distinguish it from standard pads through color or marking
5. WHEN the game UI is displayed THEN the system SHALL show the current score and high score

### Requirement 2

**User Story:** As a player, I want a spaceship to appear when I achieve a new high score, so that my accomplishment is celebrated with satisfying visual feedback.

#### Acceptance Criteria

1. WHEN the player achieves a Score greater than the current High Score THEN the system SHALL update the High Score value
2. WHEN a new High Score is achieved THEN the system SHALL display the Spaceship on screen
3. WHEN the Spaceship appears THEN the system SHALL animate it moving across the screen
4. WHEN the Spaceship is displayed THEN the system SHALL show congratulatory text announcing the new high score
5. WHEN the Spaceship animation completes THEN the system SHALL remove the Spaceship from view

### Requirement 3

**User Story:** As a player, I want to refuel and continue playing after successful landings, so that I can achieve higher scores in a continuous gameplay session without restarting.

#### Acceptance Criteria

1. WHEN the Lander successfully lands on any Landing Pad THEN the system SHALL add 150 fuel units to the Lander fuel
2. WHEN the Lander successfully lands THEN the system SHALL transition to a state allowing the player to take off again
3. WHEN the Lander collides with terrain or Mountains THEN the system SHALL end the game session
4. WHEN the Lander fuel reaches zero THEN the system SHALL end the game session
5. WHEN the game session ends THEN the system SHALL require player input to restart a new session
