if (!wait_for_async_tasks && !trampoline_done) {
	trampoline_done = true;
	log("GameStarter trampoline to next room.");
	pool_clear_all();
	room_goto(goto_room_after_init);
}
