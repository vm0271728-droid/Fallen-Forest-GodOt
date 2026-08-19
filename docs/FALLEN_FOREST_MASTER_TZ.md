# Fallen Forest — Master Technical Specification

## Project migration

Migration from Unity/C# to Godot 4/GDScript.

## Core gameplay systems

- First person horror controller
- Exploration loop
- Forest environment
- Flashlight system
- Interactive documents
- Vehicle/environment props
- Monster encounters
- Screamer events
- Audio atmosphere
- Mobile optimization

## Environment

Main environment assets:

- Trees packs
- Grass
- Forest vegetation
- Terrain dressing
- Fog and horror lighting

## Characters

Imported assets:

- Locust creature
- Boiled One creature
- FPS arms

## Import rule

Original Drive assets are the source of truth. Convert only when required for Godot compatibility or optimization.

## Development order

1. Godot project foundation
2. Asset import pipeline
3. Player controller
4. Interaction system
5. Environment blockout
6. Horror events
7. Optimization
