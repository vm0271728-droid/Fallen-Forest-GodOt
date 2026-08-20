# Fallen Forest Godot — Creature AI T3 Implementation

## LOCUST

### States
- Hidden: chooses forest hiding points and observes player.
- Observe: maintains presence without direct attack.
- Retreat: leaves when player creates distance.
- Rage: activates when player approaches during hiding or breaks retreat distance.
- Chase: navigation pursuit with non-human movement style.
- Kill: front and rear death sequences.

### Hide system
Variants:
- FarHide_A
- FarHide_B
- MediumHide
- CloseHide_A
- CloseHide_B

Distance is continuously evaluated during hide animations.
Hide animation never freezes AI calculations.

### Chase
Movement must use heavy body motion:
- forward leaning body;
- arm-supported locomotion;
- alternating support movement.

## BOILED

### States
- Observe
- GazeEvent
- Distort
- Vanish

### Gaze detection
Activation requires real line of sight.
Blocked by:
- trees;
- branches;
- grass;
- rocks;
- other world geometry.

### Gaze event
- camera focus;
- movement reduction;
- tinnitus effect;
- environmental audio suppression;
- eyes close;
- creature disappears during closed-eye moment.

## Godot mapping
Unity systems are replaced by:
- NavMesh -> NavigationAgent3D
- Animator -> AnimationTree
- C# FSM -> GDScript state machine
