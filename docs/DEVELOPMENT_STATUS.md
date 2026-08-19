# Fallen Forest — Godot Development Status

## Current milestone

**Milestone 0.2 — First Horror Playable (in progress)**

Target engine: **Godot 4.7.1 stable**  
Target platform: **Android, landscape, ARM64, mobile renderer, 60 FPS target**

## Implemented foundation

- Godot project bootstrap and native GDScript architecture.
- Main menu is the actual application entry point.
- English default + Russian menu/UI text path.
- Startup photosensitivity / jumpscare / loud-sound warning, once per app launch.
- New Game / Continue / Settings / Credits / Quit.
- Threaded loading screen with real load progress.
- Save system with deterministic run seed.
- Save persistence for documents, Boiled state, player position, final-run state, and flashlight acquisition.
- New-run wake-up sequence; Continue does not replay wake-up.

## Player / FPS presentation

- First-person CharacterBody3D controller.
- Fixed gameplay FOV: 75 degrees.
- Dedicated SubViewport viewmodel camera: 61 degrees.
- Canonical FPS arms imported from Drive.
- Canonical flashlight imported from Drive.
- Canonical document folder imported from Drive.
- Flashlight camera-turn lag / inertia.
- Flashlight pickup sequence with delayed light activation.
- Document pickup A/B/C timing variants.
- Real Skeleton3D palm integration:
  - held flashlight attaches to `R_palm`;
  - document attaches to `L_palm` during the regrip/hold phase.
- Physical lit flashlight drop during Locust death.
- Physical lit flashlight placement during finale.

## World generation

- 720 x 720 m deterministic procedural terrain.
- Four deterministic terrain-following trails.
- Trail exclusion used by trees, grass, and documents.
- 16,000 dedicated canonical grass instances from `Grass.fbx`.
- Exactly 10 deterministic documents.
- Document slope, tree-clearance, spacing, start-distance and trail-clearance rules.
- 45% firefly chance per document.
- 4–6 subtle fireflies; no PointLight quest-beacon behavior.

## Tree packs

Tree archives are treated as **multi-tree packs**, never as one tree prop.

Runtime baseline mix:

- Black spruce: 68%
- Dead fir: 14%
- Low-poly trees: 18%

Current handling:

- Black spruce LOD2 used as mobile baseline.
- Dead-fir source split into four variants: `fir_1` through `fir_4`.
- Low-poly RAR expanded into `Tree_Pack.fbx/obj/mtl`.
- `Background_Tree_Atlas*` objects are lightweight complete tree candidates.
- Detailed low-poly `Tree_Trunk_*` and `Tree_Branches_*` are paired by source-space position into complete logical trees.
- Low-poly grass, bushes, shrubs, ferns, weeds, rocks and ground content are explicitly excluded from Fallen Forest runtime use.
- Tree scale is normalized by imported source height before random variation.

## Tree collision and visibility

- Tree rendering uses MultiMesh variants.
- Nearby trunk collision uses a pooled collision manager instead of 3250 permanent colliders.
- Separate foliage LOS blockers use a raycast-only collision layer.
- Player can move through foliage blockers, but Boiled gaze/LOS is blocked by dense tree canopy.
- Generated tree positions remain available for Locust cover selection.

## Boiled One

- Canonical FBX imported.
- Real gaze-angle + physics LOS detection.
- Tree/foliage occlusion affects gaze.
- Player retains 33% movement during focus.
- Forced-look sequence.
- Boiled disappears only after eyes are fully closed / screen is fully blocked.
- Persistent subtle post-encounter glitch strips and rare microbursts.
- No PointLight / quest-marker behavior.

## Locust

- Canonical FBX and Skeleton3D imported.
- AI states: hide, retreat, rage, chase.
- Exactly five logical hide variants:
  - 2 far;
  - 1 medium;
  - 2 close.
- Hide variant selected by actual initial distance.
- Real rig animator controls spine, shoulders, upper arms, forearms and hands.
- Arm-supported chase uses alternating long-arm support motion.
- Final chase speed is 97.5% of current player max speed.
- Up to 3 Locust are spawned for the current final-run tuning.

## Locust deaths

Front and rear deaths are separate authored FPS sequences.

Both include:

- player control lock;
- FPS camera/arms reaction;
- physical lit flashlight drop when acquired;
- red/black death presentation;
- a distinct approved screamer;
- death menu.

Death menu:

- Continue;
- Main Menu.

Continue restores the saved run under blackout. A final chase is recreated after Continue when the saved run is already in final-run state.

## Finale

- 10/10 triggers final run.
- Player final-run speed multiplier: 2.15.
- Any forest boundary can start the escape.
- Remaining monsters are removed before ending control lock.
- Runtime road is created beyond the forest edge.
- Canonical pickup truck is used by a VehicleBody3D/VehicleWheel3D finale scene.
- Vehicle has four wheel nodes, suspension, traction/steering, headlights and tail lights.
- Acquired flashlight is left lit on the road and aimed back toward the forest.
- Global `AudioDirector.hard_silence()` stops current AudioStreamPlayer/2D/3D playback and sets wind state to zero.
- Look-back and fade to THE END / КОНЕЦ.
- Ending title holds for 4 seconds, then returns to Main Menu.

## Audio

Current Drive archive provides the two approved Locust screamers.

Explicitly forbidden and excluded:

- `amazing-grace-analog-horror.mp3`

A separate ambience source pack has not been identified in the canonical Drive archives. Do not silently substitute unrelated Internet ambience.

## Validation

Two CI layers exist:

### Fast GDScript validation

- Uses Godot 4.7.1 stable.
- Compiles the GDScript tree without performing the expensive full 3D import.
- Treats parser/compile diagnostics as authoritative failures.
- Added after early false-positive validation exposed parser diagnostics hidden behind exit code 0.

### Full Godot validation

- Uses Godot 4.7.1 stable.
- Full asset import.
- Separate Main Menu smoke test.
- Separate gameplay-scene smoke test.
- Asset inspection report.
- `cancel-in-progress` is disabled so a full 3D validation can finish while development continues.

## Android build pipeline

`export_presets.cfg` contains an Android debug preset:

- package: `com.fallenforest.horror`
- version: `0.2.0`
- minimum SDK: 23
- target SDK: 35
- ARM64 enabled
- ARMv7/x86/x86_64 disabled
- immersive mode
- landscape is forced in `project.godot`

GitHub Actions workflow `android-debug-apk.yml`:

- installs Java 17;
- configures Android SDK 35;
- downloads official Godot 4.7.1 binary + export templates;
- creates a temporary debug keystore;
- imports the project;
- exports `Builds/Android/FallenForest-debug.apk`;
- publishes it as `FallenForest-Android-debug` artifact when successful.

**Do not treat the Android pipeline as release signing.** Release keystore handling will be added separately and must not commit private signing material.

## Next technical priorities

1. Obtain a fresh completed full 3D smoke result for the current multi-tree/viewmodel/menu checkpoint.
2. Obtain and inspect the first successful Android debug APK artifact; fix export configuration if CI reports a concrete Android error.
3. Calibrate real FPS finger/wrist poses around flashlight and document using imported bone rest axes.
4. Visually calibrate the five Locust hide poses and arm-supported chase against the canonical FBX rest axes.
5. Expand environment dressing and landmarks without importing the excluded low-poly grass/bush payload.
6. Add ambience/foley only from approved/licensed sources; keep Hard Silence behavior independent from the chosen ambience assets.
7. Perform physical Android-device profiling and tune MultiMesh visibility ranges, pooled collision radius and viewmodel resolution for the 60 FPS target.
