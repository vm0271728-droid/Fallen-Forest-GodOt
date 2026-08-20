# Fast Godot script validation

- Engine: Godot 4.7.1 stable
- Branch: `fix/android11-integrity`
- Tested commit: `ec48236df67cd98a0f946f91f4800d1a66308082`
- Exit code: `139`
- Result: **FAIL**

```text
Godot Engine v4.7.1.stable.official.a13da4feb - https://godotengine.org


================================================================
handle_crash: Program crashed with signal 11
Engine version: Godot Engine v4.7.1.stable.official (a13da4feb8d8aefc283c3763d33a2f170a18d541)
Dumping the backtrace. Please include this when reporting the bug on: https://github.com/godotengine/godot/issues
Load address: 400000

[1] 7f577d045330 (libc.so.6+45330) - /lib/x86_64-linux-gnu/libc.so.6(+0x45330) [0x7f577d045330]
[2] 48f1c81 (main+44f1c81) - /tmp/godot/Godot_v4.7.1-stable_linux.x86_64() [0x48f1c81]
[3] afcd4d (main+6fcd4d) - /tmp/godot/Godot_v4.7.1-stable_linux.x86_64() [0xafcd4d]
[4] 93479e (main+53479e) - /tmp/godot/Godot_v4.7.1-stable_linux.x86_64() [0x93479e]
[5] 48f1115 (main+44f1115) - /tmp/godot/Godot_v4.7.1-stable_linux.x86_64() [0x48f1115]
[6] 46a79db (main+42a79db) - /tmp/godot/Godot_v4.7.1-stable_linux.x86_64() [0x46a79db]
[7] b18b38 (main+718b38) - /tmp/godot/Godot_v4.7.1-stable_linux.x86_64() [0xb18b38]
[8] 93479e (main+53479e) - /tmp/godot/Godot_v4.7.1-stable_linux.x86_64() [0x93479e]
[9] 444214e (main+404214e) - /tmp/godot/Godot_v4.7.1-stable_linux.x86_64() [0x444214e]
[10] 2adf8a3 (main+26df8a3) - /tmp/godot/Godot_v4.7.1-stable_linux.x86_64() [0x2adf8a3]
[11] 42c532 (main+2c532) - /tmp/godot/Godot_v4.7.1-stable_linux.x86_64() [0x42c532]
[12] 7f577d02a1ca (libc.so.6+2a1ca) - /lib/x86_64-linux-gnu/libc.so.6(+0x2a1ca) [0x7f577d02a1ca]
[13] 7f577d02a28b (libc.so.6+2a28b) - /lib/x86_64-linux-gnu/libc.so.6(__libc_start_main+0x8b) [0x7f577d02a28b]
[14] 48712a (main+8712a) - /tmp/godot/Godot_v4.7.1-stable_linux.x86_64() [0x48712a]
-- END OF C++ BACKTRACE --
================================================================
timeout: the monitored command dumped core
```
