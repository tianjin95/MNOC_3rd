set_global_assignment -entity "super_pll" -library "lib_super_pll" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "super_pll" -library "lib_super_pll" -name IP_TOOL_VERSION "17.1"
set_global_assignment -entity "super_pll" -library "lib_super_pll" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_super_pll" -name SPD_FILE [file join $::quartus(sip_path) "super_pll.spd"]

set_global_assignment -library "lib_super_pll" -name MISC_FILE [file join $::quartus(sip_path) "super_pll_sim/super_pll.vho"]
