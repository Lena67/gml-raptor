/// @description Store mouse/window coordinates

/*
	BEGIN STEP: Calculate new positions of mouse and window and all
*/

// ---------- MOUSE ----------
GUI_MOUSE_X_PREVIOUS = GUI_MOUSE_X;
GUI_MOUSE_Y_PREVIOUS = GUI_MOUSE_Y;
GUI_MOUSE_X = device_mouse_x_to_gui(0);
GUI_MOUSE_Y = device_mouse_y_to_gui(0);

GUI_MOUSE_DELTA_X = GUI_MOUSE_X - GUI_MOUSE_X_PREVIOUS;
GUI_MOUSE_DELTA_Y = GUI_MOUSE_Y - GUI_MOUSE_Y_PREVIOUS;

GUI_MOUSE_HAS_MOVED = GUI_MOUSE_DELTA_X != 0 || GUI_MOUSE_DELTA_Y != 0;

// ---------- WINDOW ----------
WINDOW_SIZE_X_PREVIOUS = WINDOW_SIZE_X;
WINDOW_SIZE_Y_PREVIOUS = WINDOW_SIZE_Y;
WINDOW_SIZE_X = window_get_width();
WINDOW_SIZE_Y = window_get_height();

WINDOW_SIZE_DELTA_X = WINDOW_SIZE_X - WINDOW_SIZE_X_PREVIOUS;
WINDOW_SIZE_DELTA_Y = WINDOW_SIZE_Y - WINDOW_SIZE_Y_PREVIOUS;

WINDOW_SIZE_HAS_CHANGED = WINDOW_SIZE_DELTA_X != 0 || WINDOW_SIZE_DELTA_Y != 0;


