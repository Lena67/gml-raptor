/*
	These callbacks get invoked from the GameStarter object in the
	GameStart and GameEnd events respectively.
	If the game is currently in HTML mode, HTML_LOCALES is used to set up the locale list.
	Note for locales: The first entry in the array is the fallback (default) language and
	should always contain 100% of all strings!
	
	They have been created to encapsulate one-time-startup/-shutdown actions in
	an isolated script file, so you do not need to modify the GameStarter object directly
	in each game.
	
	onGameStart runs AFTER the ci_colors have been initialized.
	It is recommended, to set at least the app_theme in the onGameStart function, so 
	scribble gets initialized with the correct set of ci_colors.
	
	------------------------------------------------------
	NOTE: HTML5 games never receive an onGameEnd callback!
	------------------------------------------------------

	(c)2022- coldrock.games, @grisgram at github
	Please respect the MIT License for this library: https://opensource.org/licenses/MIT
*/

// This macro is only used once in a html game when the game initalizes
#macro HTML_LOCALES			["en"]

// The name of your settings file. ATTENTION FOR ITCH.IO: This name must be UNIQUE across
// all your games! Do NOT reuse the same name over and over again!
#macro GAME_SETTINGS_FILENAME			"game_settings.json"
#macro FILE_CRYPT_KEY					""
// To avoid conflicts between encrypted and plaing settings files, give
// the file in release mode a different name
// Replace the production crypt key with a good salty key of your own!
#macro release:GAME_SETTINGS_FILENAME	"game_settings.gsx"
#macro release:FILE_CRYPT_KEY			"replace-this-string-for-your-own-safety"

// Global functionality setup for the game
// If you set this to any existing room (not as string! the asset), you can override the variable from the 
// GameStarter object without having to edit it
#macro ROOM_AFTER_STARTER		undefined

// Highscore setup for the game
#macro USE_HIGHSCORES			false
#macro HIGHSCORE_TABLE_NAME		"Highscores"
#macro HIGHSCORE_TABLE_LENGTH	10
#macro HIGHSCORE_TABLE_SCORING	scoring.score_high
#macro HIGHSCORES				global._HIGHSCORES

if (USE_HIGHSCORES) {
	HIGHSCORES = new HighScoreTable(HIGHSCORE_TABLE_NAME, HIGHSCORE_TABLE_LENGTH, HIGHSCORE_TABLE_SCORING);
	repeat (HIGHSCORE_TABLE_LENGTH) HIGHSCORES.register_highscore("- no entry -",0);
} else {
	HIGHSCORES = undefined;
}

/// @function function onGameStart()
/// @description	When this runs, load_settings() has already been called and 
///					you can access your settings through the GAMESETTINGS macro.
function onGameStart() {

	// Debug/Dev configuration
	DEBUG_SHOW_OBJECT_FRAMES	= false;
	DEBUG_MODE_WINDOW_WIDTH		= 1280;
	DEBUG_MODE_WINDOW_HEIGHT	= 720;
	
	DEBUG_LOG_OBJECT_POOLS		= false;
	DEBUG_LOG_LIST_POOLS		= false;
	DEBUG_LOG_STATEMACHINE		= false;
	DEBUG_LOG_RACE				= false;
	DEBUG_LOG_PARTICLES			= false;
	DEBUG_LOG_BROADCASTS		= false;
	
	// set up named colors for the game
	// You can define your own CI_colors in the CI_Colors script
	set_app_theme(ci_theme.none);

	// Load start data
	// Example lines to show that you can load your startup files here
	// ------------------------------------------------------------------
	//SOME_GLOBAL_THING = file_read_struct_plain(GLOBAL_THING_FILE_NAME);
	//race_load_file(RACE_FILE_NAME, false);

	// Setup Scribble
	// ------------------------------------------------------------------
	//scribble_font_bake_outline_8dir("acme28","acme28out",c_black,true);
	//scribble_font_set_default("acme28");

	// Custom named scribble colors - use the format that fits best for you! 
	//scribble_color_set("my_col", make_color_rgb(0xE5,0xE5,0xE5)); // 0x... hex, can also use 165,165,165 - doesn't matter
	//scribble_color_set("my_col", #E5E5E5); // #RRGGBB
	//scribble_color_set("my_col", $E5E5E5); // $BBGGRR
	
	// Audio setup for rooms
	//set_room_default_audio(rmMain, mus_theme, amb_theme);
	//set_room_default_audio(rmPlay, mus_theme, amb_theme);

}

/// @function function onGameEnd()
function onGameEnd() {
}


