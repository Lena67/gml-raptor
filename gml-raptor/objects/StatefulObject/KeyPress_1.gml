/// @description state ev:key_press_?

/*
	The key that got pressed actually is converted through the KeyTranslator script and this
	creates a readable string for almost all keys that is as-equal-as-possible to the vk_constants.
	
	This event sets the state "ev:key_press_<key>"
	Examples:
	ev:key_press_F1
	ev:key_press_vk_home
	ev:key_press_vk_left
	ev:key_press_numpad0
	...etc...
*/

if (protect_ui_events) GUI_EVENT;

states.set_state("ev:key_press_" + keyboard_to_string());

