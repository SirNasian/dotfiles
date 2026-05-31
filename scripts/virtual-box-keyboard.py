#!/usr/bin/python3

import sys
import argparse
from evdev import InputDevice, UInput, AbsInfo, ecodes as e

AXIS_MIN, AXIS_MAX, AXIS_CENTER = -32768, 32767, 0
TRIGGER_MIN, TRIGGER_MAX = 0, 255

TOGGLE_KEY = e.KEY_F12
KEY_MAP = {
	e.KEY_SEMICOLON: ("axis",    e.ABS_HAT0Y, -1), # Up
	e.KEY_D:         ("axis",    e.ABS_HAT0Y,  1), # Down
	e.KEY_S:         ("axis",    e.ABS_HAT0X, -1), # Left
	e.KEY_F:         ("axis",    e.ABS_HAT0X,  1), # Right
	e.KEY_SPACE:     ("btn",     e.BTN_SOUTH),     # A
	e.KEY_J:         ("btn",     e.BTN_EAST),      # B
	e.KEY_K:         ("btn",     e.BTN_WEST),      # X
	e.KEY_I:         ("btn",     e.BTN_NORTH),     # Y
	e.KEY_O:         ("btn",     e.BTN_TL),        # Left Bumper
	e.KEY_L:         ("btn",     e.BTN_TR),        # Right Bumper
	e.KEY_A:         ("trigger", e.ABS_Z),         # Left Trigger
	e.KEY_U:         ("trigger", e.ABS_RZ),        # Right Trigger
	e.KEY_ESC:       ("btn",     e.BTN_START),     # Start
	e.KEY_P:         ("btn",     e.BTN_SELECT),    # Select
}

def build_capabilities():
	axis_info    = AbsInfo(value=0, min=AXIS_MIN,    max=AXIS_MAX,    fuzz=0, flat=128, resolution=0)
	trigger_info = AbsInfo(value=0, min=TRIGGER_MIN, max=TRIGGER_MAX, fuzz=0, flat=0,   resolution=0)
	hat_info     = AbsInfo(value=0, min=-1,          max=1,           fuzz=0, flat=0,   resolution=0)

	return {
		e.EV_KEY: [
			e.BTN_SOUTH,  e.BTN_EAST,  e.BTN_NORTH, e.BTN_WEST,
			e.BTN_TL,     e.BTN_TR,    e.BTN_TL2,   e.BTN_TR2,
			e.BTN_SELECT, e.BTN_START, e.BTN_MODE,
			e.BTN_THUMBL, e.BTN_THUMBR,
		],
		e.EV_ABS: [
			(e.ABS_X,     axis_info),
			(e.ABS_Y,     axis_info),
			(e.ABS_RX,    axis_info),
			(e.ABS_RY,    axis_info),
			(e.ABS_Z,     trigger_info),
			(e.ABS_RZ,    trigger_info),
			(e.ABS_HAT0X, hat_info),
			(e.ABS_HAT0Y, hat_info),
		],
	}

TRIGGER_AXES = {e.ABS_Z, e.ABS_RZ}
axis_held: dict[int, set] = {} # dict[abs_code, set(held key codes)]

def axis_value_for(abs_code: int) -> int:
	if abs_code in TRIGGER_AXES:
		held = axis_held.get(abs_code, set())
		return TRIGGER_MAX if held else TRIGGER_MIN

	net = 0
	for key_code, mapping in KEY_MAP.items():
		kind, code, *rest = mapping
		if kind == "axis" and code == abs_code and key_code in axis_held.get(abs_code, set()):
			net += rest[0]

	net = max(-1, min(1, net))
	if net == 0:
		return AXIS_CENTER

	return AXIS_MAX if net > 0 else AXIS_MIN

if __name__ == "__main__":
	parser = argparse.ArgumentParser(description="Map keyboard to virtual gamepad with box layout")

    # NOTE: inspect /proc/bus/input/devices to identify device
	parser.add_argument("device", nargs="?", default="/dev/input/event0", help="Path to keyboard input device, e.g. /dev/input/event0")
	args = parser.parse_args()

	keyboard    = InputDevice(args.device)
	passthrough = UInput.from_device(keyboard, name="Virtual Gamepad Passthrough")
	gamepad     = UInput(build_capabilities(), name="Virtual Gamepad", version=0x1)

	print(f"[Virtual Gamepad] Listening on {args.device}")
	print("[Virtual Gamepad] Press Ctrl+C to quit.\n")

	keyboard.grab()
	gamepad_active = True
	try:
		for event in keyboard.read_loop():
			if event.type == e.EV_KEY and event.code == TOGGLE_KEY and event.value == 1:
				gamepad_active = not gamepad_active
				if not gamepad_active:
					for abs_code, held in axis_held.items():
						held.clear()
						reset = TRIGGER_MIN if abs_code in TRIGGER_AXES else AXIS_CENTER
						gamepad.write(e.EV_ABS, abs_code, reset)
					gamepad.syn()
				print(f"[Virtual Gamepad] {'Enabled' if gamepad_active else 'Disabled'}")
				continue

			if not gamepad_active:
				passthrough.write_event(event)
				continue

			if event.type != e.EV_KEY:
				continue

			key_code  = event.code
			key_state = event.value

			if key_code not in KEY_MAP:
				continue

			mapping = KEY_MAP[key_code]
			kind    = mapping[0]

			if kind == "btn":
				_, btn_code = mapping
				if key_state in (0, 1):
					gamepad.write(e.EV_KEY, btn_code, key_state)
					gamepad.syn()

			elif kind in ("axis", "trigger"):
				abs_code = mapping[1]
				direction = mapping[2] if kind == "axis" else 1
				held = axis_held.setdefault(abs_code, set())

				if key_state == 1:
					held.add(key_code)
				elif key_state == 0:
					held.discard(key_code)
				else:
					continue

				value = axis_value_for(abs_code)
				gamepad.write(e.EV_ABS, abs_code, value)
				gamepad.syn()

	except KeyboardInterrupt:
		print("\n[Virtual Gamepad] Stopped.")

	finally:
		gamepad.close()
		passthrough.close()
		keyboard.ungrab()
