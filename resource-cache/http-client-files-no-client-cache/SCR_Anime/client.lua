local guiler = {}

local sx, sy = guiGetScreenSize()



animasyonlar = {

	[1]  = {isim = "Soon",  blockName = "",  path = "", animations = { 'abseil', 'ARRESTgun', 'ATM', 'BIKE_elbowL', 'BIKE_elbowR', 'BIKE_fallR', 'BIKE_fall_off', 'BIKE_pickupL', 'BIKE_pickupR', 'BIKE_pullupL', 'BIKE_pullupR', 'bomber', 'CAR_alignHI_LHS', 'CAR_alignHI_RHS', 'CAR_align_LHS', 'CAR_align_RHS', 'CAR_closedoorL_LHS', 'CAR_closedoorL_RHS', 'CAR_closedoor_LHS', 'CAR_closedoor_RHS', 'CAR_close_LHS', 'CAR_close_RHS', 'CAR_crawloutRHS', 'CAR_dead_LHS', 'CAR_dead_RHS', 'CAR_doorlocked_LHS', 'CAR_doorlocked_RHS', 'CAR_fallout_LHS', 'CAR_fallout_RHS', 'CAR_getinL_LHS', 'CAR_getinL_RHS', 'CAR_getin_LHS', 'CAR_getin_RHS', 'CAR_getoutL_LHS', 'CAR_getoutL_RHS', 'CAR_getout_LHS', 'CAR_getout_RHS', 'car_hookertalk', 'CAR_jackedLHS', 'CAR_jackedRHS', 'CAR_jumpin_LHS', 'CAR_LB', 'CAR_LB_pro', 'CAR_LB_weak', 'CAR_LjackedLHS', 'CAR_LjackedRHS', 'CAR_Lshuffle_RHS', 'CAR_Lsit', 'CAR_open_LHS', 'CAR_open_RHS', 'CAR_pulloutL_LHS', 'CAR_pulloutL_RHS', 'CAR_pullout_LHS', 'CAR_pullout_RHS', 'CAR_Qjacked', 'CAR_rolldoor', 'CAR_rolldoorLO', 'CAR_rollout_LHS', 'CAR_rollout_RHS', 'CAR_shuffle_RHS', 'CAR_sit', 'CAR_sitp', 'CAR_sitpLO', 'CAR_sit_pro', 'CAR_sit_weak', 'CAR_tune_radio', 'CLIMB_idle', 'CLIMB_jump', 'CLIMB_jump2fall', 'CLIMB_jump_B', 'CLIMB_Pull', 'CLIMB_Stand', 'CLIMB_Stand_finish', 'cower', 'Crouch_Roll_L', 'Crouch_Roll_R', 'DAM_armL_frmBK', 'DAM_armL_frmFT', 'DAM_armL_frmLT', 'DAM_armR_frmBK', 'DAM_armR_frmFT', 'DAM_armR_frmRT', 'DAM_LegL_frmBK', 'DAM_LegL_frmFT', 'DAM_LegL_frmLT', 'DAM_LegR_frmBK', 'DAM_LegR_frmFT', 'DAM_LegR_frmRT', 'DAM_stomach_frmBK', 'DAM_stomach_frmFT', 'DAM_stomach_frmLT', 'DAM_stomach_frmRT', 'DOOR_LHinge_O', 'DOOR_RHinge_O', 'DrivebyL_L', 'DrivebyL_R', 'Driveby_L', 'Driveby_R', 'DRIVE_BOAT', 'DRIVE_BOAT_back', 'DRIVE_BOAT_L', 'DRIVE_BOAT_R', 'Drive_L', 'Drive_LO_l', 'Drive_LO_R', 'Drive_L_pro', 'Drive_L_pro_slow', 'Drive_L_slow', 'Drive_L_weak', 'Drive_L_weak_slow', 'Drive_R', 'Drive_R_pro', 'Drive_R_pro_slow', 'Drive_R_slow', 'Drive_R_weak', 'Drive_R_weak_slow', 'Drive_truck', 'DRIVE_truck_back', 'DRIVE_truck_L', 'DRIVE_truck_R', 'Drown', 'DUCK_cower', 'endchat_01', 'endchat_02', 'endchat_03', 'EV_dive', 'EV_step', 'facanger', 'facgum', 'facsurp', 'facsurpm', 'factalk', 'facurios', 'FALL_back', 'FALL_collapse', 'FALL_fall', 'FALL_front', 'FALL_glide', 'FALL_land', 'FALL_skyDive', 'Fight2Idle', 'FightA_1', 'FightA_2', 'FightA_3', 'FightA_block', 'FightA_G', 'FightA_M', 'FIGHTIDLE', 'FightShB', 'FightShF', 'FightSh_BWD', 'FightSh_FWD', 'FightSh_Left', 'FightSh_Right', 'flee_lkaround_01', 'FLOOR_hit', 'FLOOR_hit_f', 'fucku', 'gang_gunstand', 'gas_cwr', 'getup', 'getup_front', 'gum_eat', 'GunCrouchBwd', 'GunCrouchFwd', 'GunMove_BWD', 'GunMove_FWD', 'GunMove_L', 'GunMove_R', 'Gun_2_IDLE', 'GUN_BUTT', 'GUN_BUTT_crouch', 'Gun_stand', 'handscower', 'handsup', 'HitA_1', 'HitA_2', 'HitA_3', 'HIT_back', 'HIT_behind', 'HIT_front', 'HIT_GUN_BUTT', 'HIT_L', 'HIT_R', 'HIT_walk', 'HIT_wall', 'Idlestance_fat', 'idlestance_old', 'IDLE_armed', 'IDLE_chat', 'IDLE_csaw', 'Idle_Gang1', 'IDLE_HBHB', 'IDLE_ROCKET', 'IDLE_stance', 'IDLE_taxi', 'IDLE_tired', 'Jetpack_Idle', 'JOG_femaleA', 'JOG_maleA', 'JUMP_glide', 'JUMP_land', 'JUMP_launch', 'JUMP_launch_R', 'KART_drive', 'KART_L', 'KART_LB', 'KART_R', 'KD_left', 'KD_right', 'KO_shot_face', 'KO_shot_front', 'KO_shot_stom', 'KO_skid_back', 'KO_skid_front', 'KO_spin_L', 'KO_spin_R', 'pass_Smoke_in_car', 'phone_in', 'phone_out', 'phone_talk', 'Player_Sneak', 'Player_Sneak_walkstart', 'roadcross', 'roadcross_female', 'roadcross_gang', 'roadcross_old', 'run_1armed', 'run_armed', 'run_civi', 'run_csaw', 'run_fat', 'run_fatold', 'run_gang1', 'run_left', 'run_old', 'run_player', 'run_right', 'run_rocket', 'Run_stop', 'Run_stopR', 'Run_Wuzi', 'SEAT_down', 'SEAT_idle', 'SEAT_up', 'SHOT_leftP', 'SHOT_partial', 'SHOT_partial_B', 'SHOT_rightP', 'Shove_Partial', 'Smoke_in_car', 'sprint_civi', 'sprint_panic', 'Sprint_Wuzi', 'swat_run', 'Swim_Tread', 'Tap_hand', 'Tap_handP', 'turn_180', 'Turn_L', 'Turn_R', 'WALK_armed', 'WALK_civi', 'WALK_csaw', 'Walk_DoorPartial', 'WALK_drunk', 'WALK_fat', 'WALK_fatold', 'WALK_gang1', 'WALK_gang2', 'WALK_old', 'WALK_player', 'WALK_rocket', 'WALK_shuffle', 'WALK_start', 'WALK_start_armed', 'WALK_start_csaw', 'WALK_start_rocket', 'Walk_Wuzi', 'WEAPON_crouch', 'woman_idlestance', 'woman_run', 'WOMAN_runbusy', 'WOMAN_runfatold', 'woman_runpanic', 'WOMAN_runsexy', 'WOMAN_walkbusy', 'WOMAN_walkfatold', 'WOMAN_walknorm', 'WOMAN_walkold', 'WOMAN_walkpro', 'WOMAN_walksexy', 'WOMAN_walkshop', 'XPRESSscratch', 'sprint_civi' }, durum = "Special"},

	[2]  = {isim = "Police Animation",  blockName = "eren",  path = "anims/eren.ifp", animations = { 'abseil', 'ARRESTgun', 'ATM', 'BIKE_elbowL', 'BIKE_elbowR', 'BIKE_fallR', 'BIKE_fall_off', 'BIKE_pickupL', 'BIKE_pickupR', 'BIKE_pullupL', 'BIKE_pullupR', 'bomber', 'CAR_alignHI_LHS', 'CAR_alignHI_RHS', 'CAR_align_LHS', 'CAR_align_RHS', 'CAR_closedoorL_LHS', 'CAR_closedoorL_RHS', 'CAR_closedoor_LHS', 'CAR_closedoor_RHS', 'CAR_close_LHS', 'CAR_close_RHS', 'CAR_crawloutRHS', 'CAR_dead_LHS', 'CAR_dead_RHS', 'CAR_doorlocked_LHS', 'CAR_doorlocked_RHS', 'CAR_fallout_LHS', 'CAR_fallout_RHS', 'CAR_getinL_LHS', 'CAR_getinL_RHS', 'CAR_getin_LHS', 'CAR_getin_RHS', 'CAR_getoutL_LHS', 'CAR_getoutL_RHS', 'CAR_getout_LHS', 'CAR_getout_RHS', 'car_hookertalk', 'CAR_jackedLHS', 'CAR_jackedRHS', 'CAR_jumpin_LHS', 'CAR_LB', 'CAR_LB_pro', 'CAR_LB_weak', 'CAR_LjackedLHS', 'CAR_LjackedRHS', 'CAR_Lshuffle_RHS', 'CAR_Lsit', 'CAR_open_LHS', 'CAR_open_RHS', 'CAR_pulloutL_LHS', 'CAR_pulloutL_RHS', 'CAR_pullout_LHS', 'CAR_pullout_RHS', 'CAR_Qjacked', 'CAR_rolldoor', 'CAR_rolldoorLO', 'CAR_rollout_LHS', 'CAR_rollout_RHS', 'CAR_shuffle_RHS', 'CAR_sit', 'CAR_sitp', 'CAR_sitpLO', 'CAR_sit_pro', 'CAR_sit_weak', 'CAR_tune_radio', 'CLIMB_idle', 'CLIMB_jump', 'CLIMB_jump2fall', 'CLIMB_jump_B', 'CLIMB_Pull', 'CLIMB_Stand', 'CLIMB_Stand_finish', 'cower', 'Crouch_Roll_L', 'Crouch_Roll_R', 'DAM_armL_frmBK', 'DAM_armL_frmFT', 'DAM_armL_frmLT', 'DAM_armR_frmBK', 'DAM_armR_frmFT', 'DAM_armR_frmRT', 'DAM_LegL_frmBK', 'DAM_LegL_frmFT', 'DAM_LegL_frmLT', 'DAM_LegR_frmBK', 'DAM_LegR_frmFT', 'DAM_LegR_frmRT', 'DAM_stomach_frmBK', 'DAM_stomach_frmFT', 'DAM_stomach_frmLT', 'DAM_stomach_frmRT', 'DOOR_LHinge_O', 'DOOR_RHinge_O', 'DrivebyL_L', 'DrivebyL_R', 'Driveby_L', 'Driveby_R', 'DRIVE_BOAT', 'DRIVE_BOAT_back', 'DRIVE_BOAT_L', 'DRIVE_BOAT_R', 'Drive_L', 'Drive_LO_l', 'Drive_LO_R', 'Drive_L_pro', 'Drive_L_pro_slow', 'Drive_L_slow', 'Drive_L_weak', 'Drive_L_weak_slow', 'Drive_R', 'Drive_R_pro', 'Drive_R_pro_slow', 'Drive_R_slow', 'Drive_R_weak', 'Drive_R_weak_slow', 'Drive_truck', 'DRIVE_truck_back', 'DRIVE_truck_L', 'DRIVE_truck_R', 'Drown', 'DUCK_cower', 'endchat_01', 'endchat_02', 'endchat_03', 'EV_dive', 'EV_step', 'facanger', 'facgum', 'facsurp', 'facsurpm', 'factalk', 'facurios', 'FALL_back', 'FALL_collapse', 'FALL_fall', 'FALL_front', 'FALL_glide', 'FALL_land', 'FALL_skyDive', 'Fight2Idle', 'FightA_1', 'FightA_2', 'FightA_3', 'FightA_block', 'FightA_G', 'FightA_M', 'FIGHTIDLE', 'FightShB', 'FightShF', 'FightSh_BWD', 'FightSh_FWD', 'FightSh_Left', 'FightSh_Right', 'flee_lkaround_01', 'FLOOR_hit', 'FLOOR_hit_f', 'fucku', 'gang_gunstand', 'gas_cwr', 'getup', 'getup_front', 'gum_eat', 'GunCrouchBwd', 'GunCrouchFwd', 'GunMove_BWD', 'GunMove_FWD', 'GunMove_L', 'GunMove_R', 'Gun_2_IDLE', 'GUN_BUTT', 'GUN_BUTT_crouch', 'Gun_stand', 'handscower', 'handsup', 'HitA_1', 'HitA_2', 'HitA_3', 'HIT_back', 'HIT_behind', 'HIT_front', 'HIT_GUN_BUTT', 'HIT_L', 'HIT_R', 'HIT_walk', 'HIT_wall', 'Idlestance_fat', 'idlestance_old', 'IDLE_armed', 'IDLE_chat', 'IDLE_csaw', 'Idle_Gang1', 'IDLE_HBHB', 'IDLE_ROCKET', 'IDLE_stance', 'IDLE_taxi', 'IDLE_tired', 'Jetpack_Idle', 'JOG_femaleA', 'JOG_maleA', 'JUMP_glide', 'JUMP_land', 'JUMP_launch', 'JUMP_launch_R', 'KART_drive', 'KART_L', 'KART_LB', 'KART_R', 'KD_left', 'KD_right', 'KO_shot_face', 'KO_shot_front', 'KO_shot_stom', 'KO_skid_back', 'KO_skid_front', 'KO_spin_L', 'KO_spin_R', 'pass_Smoke_in_car', 'phone_in', 'phone_out', 'phone_talk', 'Player_Sneak', 'Player_Sneak_walkstart', 'roadcross', 'roadcross_female', 'roadcross_gang', 'roadcross_old', 'run_1armed', 'run_armed', 'run_civi', 'run_csaw', 'run_fat', 'run_fatold', 'run_gang1', 'run_left', 'run_old', 'run_player', 'run_right', 'run_rocket', 'Run_stop', 'Run_stopR', 'Run_Wuzi', 'SEAT_down', 'SEAT_idle', 'SEAT_up', 'SHOT_leftP', 'SHOT_partial', 'SHOT_partial_B', 'SHOT_rightP', 'Shove_Partial', 'Smoke_in_car', 'sprint_civi', 'sprint_panic', 'Sprint_Wuzi', 'swat_run', 'Swim_Tread', 'Tap_hand', 'Tap_handP', 'turn_180', 'Turn_L', 'Turn_R', 'WALK_armed', 'WALK_civi', 'WALK_csaw', 'Walk_DoorPartial', 'WALK_drunk', 'WALK_fat', 'WALK_fatold', 'WALK_gang1', 'WALK_gang2', 'WALK_old', 'WALK_player', 'WALK_rocket', 'WALK_shuffle', 'WALK_start', 'WALK_start_armed', 'WALK_start_csaw', 'WALK_start_rocket', 'Walk_Wuzi', 'WEAPON_crouch', 'woman_idlestance', 'woman_run', 'WOMAN_runbusy', 'WOMAN_runfatold', 'woman_runpanic', 'WOMAN_runsexy', 'WOMAN_walkbusy', 'WOMAN_walkfatold', 'WOMAN_walknorm', 'WOMAN_walkold', 'WOMAN_walkpro', 'WOMAN_walksexy', 'WOMAN_walkshop', 'XPRESSscratch' }, durum = "Special"},

    [3]  = {isim = "Parkur Animation",  blockName = "parkur",  path = "anims/parkur.ifp", animations = { 'abseil', 'ARRESTgun', 'ATM', 'BIKE_elbowL', 'BIKE_elbowR', 'BIKE_fallR', 'BIKE_fall_off', 'BIKE_pickupL', 'BIKE_pickupR', 'BIKE_pullupL', 'BIKE_pullupR', 'bomber', 'CAR_alignHI_LHS', 'CAR_alignHI_RHS', 'CAR_align_LHS', 'CAR_align_RHS', 'CAR_closedoorL_LHS', 'CAR_closedoorL_RHS', 'CAR_closedoor_LHS', 'CAR_closedoor_RHS', 'CAR_close_LHS', 'CAR_close_RHS', 'CAR_crawloutRHS', 'CAR_dead_LHS', 'CAR_dead_RHS', 'CAR_doorlocked_LHS', 'CAR_doorlocked_RHS', 'CAR_fallout_LHS', 'CAR_fallout_RHS', 'CAR_getinL_LHS', 'CAR_getinL_RHS', 'CAR_getin_LHS', 'CAR_getin_RHS', 'CAR_getoutL_LHS', 'CAR_getoutL_RHS', 'CAR_getout_LHS', 'CAR_getout_RHS', 'car_hookertalk', 'CAR_jackedLHS', 'CAR_jackedRHS', 'CAR_jumpin_LHS', 'CAR_LB', 'CAR_LB_pro', 'CAR_LB_weak', 'CAR_LjackedLHS', 'CAR_LjackedRHS', 'CAR_Lshuffle_RHS', 'CAR_Lsit', 'CAR_open_LHS', 'CAR_open_RHS', 'CAR_pulloutL_LHS', 'CAR_pulloutL_RHS', 'CAR_pullout_LHS', 'CAR_pullout_RHS', 'CAR_Qjacked', 'CAR_rolldoor', 'CAR_rolldoorLO', 'CAR_rollout_LHS', 'CAR_rollout_RHS', 'CAR_shuffle_RHS', 'CAR_sit', 'CAR_sitp', 'CAR_sitpLO', 'CAR_sit_pro', 'CAR_sit_weak', 'CAR_tune_radio', 'CLIMB_idle', 'CLIMB_jump', 'CLIMB_jump2fall', 'CLIMB_jump_B', 'CLIMB_Pull', 'CLIMB_Stand', 'CLIMB_Stand_finish', 'cower', 'Crouch_Roll_L', 'Crouch_Roll_R', 'DAM_armL_frmBK', 'DAM_armL_frmFT', 'DAM_armL_frmLT', 'DAM_armR_frmBK', 'DAM_armR_frmFT', 'DAM_armR_frmRT', 'DAM_LegL_frmBK', 'DAM_LegL_frmFT', 'DAM_LegL_frmLT', 'DAM_LegR_frmBK', 'DAM_LegR_frmFT', 'DAM_LegR_frmRT', 'DAM_stomach_frmBK', 'DAM_stomach_frmFT', 'DAM_stomach_frmLT', 'DAM_stomach_frmRT', 'DOOR_LHinge_O', 'DOOR_RHinge_O', 'DrivebyL_L', 'DrivebyL_R', 'Driveby_L', 'Driveby_R', 'DRIVE_BOAT', 'DRIVE_BOAT_back', 'DRIVE_BOAT_L', 'DRIVE_BOAT_R', 'Drive_L', 'Drive_LO_l', 'Drive_LO_R', 'Drive_L_pro', 'Drive_L_pro_slow', 'Drive_L_slow', 'Drive_L_weak', 'Drive_L_weak_slow', 'Drive_R', 'Drive_R_pro', 'Drive_R_pro_slow', 'Drive_R_slow', 'Drive_R_weak', 'Drive_R_weak_slow', 'Drive_truck', 'DRIVE_truck_back', 'DRIVE_truck_L', 'DRIVE_truck_R', 'Drown', 'DUCK_cower', 'endchat_01', 'endchat_02', 'endchat_03', 'EV_dive', 'EV_step', 'facanger', 'facgum', 'facsurp', 'facsurpm', 'factalk', 'facurios', 'FALL_back', 'FALL_collapse', 'FALL_fall', 'FALL_front', 'FALL_glide', 'FALL_land', 'FALL_skyDive', 'Fight2Idle', 'FightA_1', 'FightA_2', 'FightA_3', 'FightA_block', 'FightA_G', 'FightA_M', 'FIGHTIDLE', 'FightShB', 'FightShF', 'FightSh_BWD', 'FightSh_FWD', 'FightSh_Left', 'FightSh_Right', 'flee_lkaround_01', 'FLOOR_hit', 'FLOOR_hit_f', 'fucku', 'gang_gunstand', 'gas_cwr', 'getup', 'getup_front', 'gum_eat', 'GunCrouchBwd', 'GunCrouchFwd', 'GunMove_BWD', 'GunMove_FWD', 'GunMove_L', 'GunMove_R', 'Gun_2_IDLE', 'GUN_BUTT', 'GUN_BUTT_crouch', 'Gun_stand', 'handscower', 'handsup', 'HitA_1', 'HitA_2', 'HitA_3', 'HIT_back', 'HIT_behind', 'HIT_front', 'HIT_GUN_BUTT', 'HIT_L', 'HIT_R', 'HIT_walk', 'HIT_wall', 'Idlestance_fat', 'idlestance_old', 'IDLE_armed', 'IDLE_chat', 'IDLE_csaw', 'Idle_Gang1', 'IDLE_HBHB', 'IDLE_ROCKET', 'IDLE_stance', 'IDLE_taxi', 'IDLE_tired', 'Jetpack_Idle', 'JOG_femaleA', 'JOG_maleA', 'JUMP_glide', 'JUMP_land', 'JUMP_launch', 'JUMP_launch_R', 'KART_drive', 'KART_L', 'KART_LB', 'KART_R', 'KD_left', 'KD_right', 'KO_shot_face', 'KO_shot_front', 'KO_shot_stom', 'KO_skid_back', 'KO_skid_front', 'KO_spin_L', 'KO_spin_R', 'pass_Smoke_in_car', 'phone_in', 'phone_out', 'phone_talk', 'Player_Sneak', 'Player_Sneak_walkstart', 'roadcross', 'roadcross_female', 'roadcross_gang', 'roadcross_old', 'run_1armed', 'run_armed', 'run_civi', 'run_csaw', 'run_fat', 'run_fatold', 'run_gang1', 'run_left', 'run_old', 'run_player', 'run_right', 'run_rocket', 'Run_stop', 'Run_stopR', 'Run_Wuzi', 'SEAT_down', 'SEAT_idle', 'SEAT_up', 'SHOT_leftP', 'SHOT_partial', 'SHOT_partial_B', 'SHOT_rightP', 'Shove_Partial', 'Smoke_in_car', 'sprint_civi', 'sprint_panic', 'Sprint_Wuzi', 'swat_run', 'Swim_Tread', 'Tap_hand', 'Tap_handP', 'turn_180', 'Turn_L', 'Turn_R', 'WALK_armed', 'WALK_civi', 'WALK_csaw', 'Walk_DoorPartial', 'WALK_drunk', 'WALK_fat', 'WALK_fatold', 'WALK_gang1', 'WALK_gang2', 'WALK_old', 'WALK_player', 'WALK_rocket', 'WALK_shuffle', 'WALK_start', 'WALK_start_armed', 'WALK_start_csaw', 'WALK_start_rocket', 'Walk_Wuzi', 'WEAPON_crouch', 'woman_idlestance', 'woman_run', 'WOMAN_runbusy', 'WOMAN_runfatold', 'woman_runpanic', 'WOMAN_runsexy', 'WOMAN_walkbusy', 'WOMAN_walkfatold', 'WOMAN_walknorm', 'WOMAN_walkold', 'WOMAN_walkpro', 'WOMAN_walksexy', 'WOMAN_walkshop', 'XPRESSscratch', 'KO_shot_stom' }, durum = "Special"},

	[4]  = {isim = "Gangster Animation I",  blockName = "mert",  path = "anims/mert.ifp", animations = { 'abseil', 'ARRESTgun', 'ATM', 'BIKE_elbowL', 'BIKE_elbowR', 'BIKE_fallR', 'BIKE_fall_off', 'BIKE_pickupL', 'BIKE_pickupR', 'BIKE_pullupL', 'BIKE_pullupR', 'bomber', 'CAR_alignHI_LHS', 'CAR_alignHI_RHS', 'CAR_align_LHS', 'CAR_align_RHS', 'CAR_closedoorL_LHS', 'CAR_closedoorL_RHS', 'CAR_closedoor_LHS', 'CAR_closedoor_RHS', 'CAR_close_LHS', 'CAR_close_RHS', 'CAR_crawloutRHS', 'CAR_dead_LHS', 'CAR_dead_RHS', 'CAR_doorlocked_LHS', 'CAR_doorlocked_RHS', 'CAR_fallout_LHS', 'CAR_fallout_RHS', 'CAR_getinL_LHS', 'CAR_getinL_RHS', 'CAR_getin_LHS', 'CAR_getin_RHS', 'CAR_getoutL_LHS', 'CAR_getoutL_RHS', 'CAR_getout_LHS', 'CAR_getout_RHS', 'car_hookertalk', 'CAR_jackedLHS', 'CAR_jackedRHS', 'CAR_jumpin_LHS', 'CAR_LB', 'CAR_LB_pro', 'CAR_LB_weak', 'CAR_LjackedLHS', 'CAR_LjackedRHS', 'CAR_Lshuffle_RHS', 'CAR_Lsit', 'CAR_open_LHS', 'CAR_open_RHS', 'CAR_pulloutL_LHS', 'CAR_pulloutL_RHS', 'CAR_pullout_LHS', 'CAR_pullout_RHS', 'CAR_Qjacked', 'CAR_rolldoor', 'CAR_rolldoorLO', 'CAR_rollout_LHS', 'CAR_rollout_RHS', 'CAR_shuffle_RHS', 'CAR_sit', 'CAR_sitp', 'CAR_sitpLO', 'CAR_sit_pro', 'CAR_sit_weak', 'CAR_tune_radio', 'CLIMB_idle', 'CLIMB_jump', 'CLIMB_jump2fall', 'CLIMB_jump_B', 'CLIMB_Pull', 'CLIMB_Stand', 'CLIMB_Stand_finish', 'cower', 'Crouch_Roll_L', 'Crouch_Roll_R', 'DAM_armL_frmBK', 'DAM_armL_frmFT', 'DAM_armL_frmLT', 'DAM_armR_frmBK', 'DAM_armR_frmFT', 'DAM_armR_frmRT', 'DAM_LegL_frmBK', 'DAM_LegL_frmFT', 'DAM_LegL_frmLT', 'DAM_LegR_frmBK', 'DAM_LegR_frmFT', 'DAM_LegR_frmRT', 'DAM_stomach_frmBK', 'DAM_stomach_frmFT', 'DAM_stomach_frmLT', 'DAM_stomach_frmRT', 'DOOR_LHinge_O', 'DOOR_RHinge_O', 'DrivebyL_L', 'DrivebyL_R', 'Driveby_L', 'Driveby_R', 'DRIVE_BOAT', 'DRIVE_BOAT_back', 'DRIVE_BOAT_L', 'DRIVE_BOAT_R', 'Drive_L', 'Drive_LO_l', 'Drive_LO_R', 'Drive_L_pro', 'Drive_L_pro_slow', 'Drive_L_slow', 'Drive_L_weak', 'Drive_L_weak_slow', 'Drive_R', 'Drive_R_pro', 'Drive_R_pro_slow', 'Drive_R_slow', 'Drive_R_weak', 'Drive_R_weak_slow', 'Drive_truck', 'DRIVE_truck_back', 'DRIVE_truck_L', 'DRIVE_truck_R', 'Drown', 'DUCK_cower', 'endchat_01', 'endchat_02', 'endchat_03', 'EV_dive', 'EV_step', 'facanger', 'facgum', 'facsurp', 'facsurpm', 'factalk', 'facurios', 'FALL_back', 'FALL_collapse', 'FALL_fall', 'FALL_front', 'FALL_glide', 'FALL_land', 'FALL_skyDive', 'Fight2Idle', 'FightA_1', 'FightA_2', 'FightA_3', 'FightA_block', 'FightA_G', 'FightA_M', 'FIGHTIDLE', 'FightShB', 'FightShF', 'FightSh_BWD', 'FightSh_FWD', 'FightSh_Left', 'FightSh_Right', 'flee_lkaround_01', 'FLOOR_hit', 'FLOOR_hit_f', 'fucku', 'gang_gunstand', 'gas_cwr', 'getup', 'getup_front', 'gum_eat', 'GunCrouchBwd', 'GunCrouchFwd', 'GunMove_BWD', 'GunMove_FWD', 'GunMove_L', 'GunMove_R', 'Gun_2_IDLE', 'GUN_BUTT', 'GUN_BUTT_crouch', 'Gun_stand', 'handscower', 'handsup', 'HitA_1', 'HitA_2', 'HitA_3', 'HIT_back', 'HIT_behind', 'HIT_front', 'HIT_GUN_BUTT', 'HIT_L', 'HIT_R', 'HIT_walk', 'HIT_wall', 'Idlestance_fat', 'idlestance_old', 'IDLE_armed', 'IDLE_chat', 'IDLE_csaw', 'Idle_Gang1', 'IDLE_HBHB', 'IDLE_ROCKET', 'IDLE_stance', 'IDLE_taxi', 'IDLE_tired', 'Jetpack_Idle', 'JOG_femaleA', 'JOG_maleA', 'JUMP_glide', 'JUMP_land', 'JUMP_launch', 'JUMP_launch_R', 'KART_drive', 'KART_L', 'KART_LB', 'KART_R', 'KD_left', 'KD_right', 'KO_shot_face', 'KO_shot_front', 'KO_shot_stom', 'KO_skid_back', 'KO_skid_front', 'KO_spin_L', 'KO_spin_R', 'pass_Smoke_in_car', 'phone_in', 'phone_out', 'phone_talk', 'Player_Sneak', 'Player_Sneak_walkstart', 'roadcross', 'roadcross_female', 'roadcross_gang', 'roadcross_old', 'run_1armed', 'run_armed', 'run_civi', 'run_csaw', 'run_fat', 'run_fatold', 'run_gang1', 'run_left', 'run_old', 'run_player', 'run_right', 'run_rocket', 'Run_stop', 'Run_stopR', 'Run_Wuzi', 'SEAT_down', 'SEAT_idle', 'SEAT_up', 'SHOT_leftP', 'SHOT_partial', 'SHOT_partial_B', 'SHOT_rightP', 'Shove_Partial', 'Smoke_in_car', 'sprint_civi', 'sprint_panic', 'Sprint_Wuzi', 'swat_run', 'Swim_Tread', 'Tap_hand', 'Tap_handP', 'turn_180', 'Turn_L', 'Turn_R', 'WALK_armed', 'WALK_civi', 'WALK_csaw', 'Walk_DoorPartial', 'WALK_drunk', 'WALK_fat', 'WALK_fatold', 'WALK_gang1', 'WALK_gang2', 'WALK_old', 'WALK_player', 'WALK_rocket', 'WALK_shuffle', 'WALK_start', 'WALK_start_armed', 'WALK_start_csaw', 'WALK_start_rocket', 'Walk_Wuzi', 'WEAPON_crouch', 'woman_idlestance', 'woman_run', 'WOMAN_runbusy', 'WOMAN_runfatold', 'woman_runpanic', 'WOMAN_runsexy', 'WOMAN_walkbusy', 'WOMAN_walkfatold', 'WOMAN_walknorm', 'WOMAN_walkold', 'WOMAN_walkpro', 'WOMAN_walksexy', 'WOMAN_walkshop', 'XPRESSscratch', 'sprint_civi' }, durum = "Special"},

	[5]  = {isim = "Watch Dogs Animation",  blockName = "arena",  path = "anims/arena.ifp", animations = { 'abseil', 'ARRESTgun', 'ATM', 'BIKE_elbowL', 'BIKE_elbowR', 'BIKE_fallR', 'BIKE_fall_off', 'BIKE_pickupL', 'BIKE_pickupR', 'BIKE_pullupL', 'BIKE_pullupR', 'bomber', 'CAR_alignHI_LHS', 'CAR_alignHI_RHS', 'CAR_align_LHS', 'CAR_align_RHS', 'CAR_closedoorL_LHS', 'CAR_closedoorL_RHS', 'CAR_closedoor_LHS', 'CAR_closedoor_RHS', 'CAR_close_LHS', 'CAR_close_RHS', 'CAR_crawloutRHS', 'CAR_dead_LHS', 'CAR_dead_RHS', 'CAR_doorlocked_LHS', 'CAR_doorlocked_RHS', 'CAR_fallout_LHS', 'CAR_fallout_RHS', 'CAR_getinL_LHS', 'CAR_getinL_RHS', 'CAR_getin_LHS', 'CAR_getin_RHS', 'CAR_getoutL_LHS', 'CAR_getoutL_RHS', 'CAR_getout_LHS', 'CAR_getout_RHS', 'car_hookertalk', 'CAR_jackedLHS', 'CAR_jackedRHS', 'CAR_jumpin_LHS', 'CAR_LB', 'CAR_LB_pro', 'CAR_LB_weak', 'CAR_LjackedLHS', 'CAR_LjackedRHS', 'CAR_Lshuffle_RHS', 'CAR_Lsit', 'CAR_open_LHS', 'CAR_open_RHS', 'CAR_pulloutL_LHS', 'CAR_pulloutL_RHS', 'CAR_pullout_LHS', 'CAR_pullout_RHS', 'CAR_Qjacked', 'CAR_rolldoor', 'CAR_rolldoorLO', 'CAR_rollout_LHS', 'CAR_rollout_RHS', 'CAR_shuffle_RHS', 'CAR_sit', 'CAR_sitp', 'CAR_sitpLO', 'CAR_sit_pro', 'CAR_sit_weak', 'CAR_tune_radio', 'CLIMB_idle', 'CLIMB_jump', 'CLIMB_jump2fall', 'CLIMB_jump_B', 'CLIMB_Pull', 'CLIMB_Stand', 'CLIMB_Stand_finish', 'cower', 'Crouch_Roll_L', 'Crouch_Roll_R', 'DAM_armL_frmBK', 'DAM_armL_frmFT', 'DAM_armL_frmLT', 'DAM_armR_frmBK', 'DAM_armR_frmFT', 'DAM_armR_frmRT', 'DAM_LegL_frmBK', 'DAM_LegL_frmFT', 'DAM_LegL_frmLT', 'DAM_LegR_frmBK', 'DAM_LegR_frmFT', 'DAM_LegR_frmRT', 'DAM_stomach_frmBK', 'DAM_stomach_frmFT', 'DAM_stomach_frmLT', 'DAM_stomach_frmRT', 'DOOR_LHinge_O', 'DOOR_RHinge_O', 'DrivebyL_L', 'DrivebyL_R', 'Driveby_L', 'Driveby_R', 'DRIVE_BOAT', 'DRIVE_BOAT_back', 'DRIVE_BOAT_L', 'DRIVE_BOAT_R', 'Drive_L', 'Drive_LO_l', 'Drive_LO_R', 'Drive_L_pro', 'Drive_L_pro_slow', 'Drive_L_slow', 'Drive_L_weak', 'Drive_L_weak_slow', 'Drive_R', 'Drive_R_pro', 'Drive_R_pro_slow', 'Drive_R_slow', 'Drive_R_weak', 'Drive_R_weak_slow', 'Drive_truck', 'DRIVE_truck_back', 'DRIVE_truck_L', 'DRIVE_truck_R', 'Drown', 'DUCK_cower', 'endchat_01', 'endchat_02', 'endchat_03', 'EV_dive', 'EV_step', 'facanger', 'facgum', 'facsurp', 'facsurpm', 'factalk', 'facurios', 'FALL_back', 'FALL_collapse', 'FALL_fall', 'FALL_front', 'FALL_glide', 'FALL_land', 'FALL_skyDive', 'Fight2Idle', 'FightA_1', 'FightA_2', 'FightA_3', 'FightA_block', 'FightA_G', 'FightA_M', 'FIGHTIDLE', 'FightShB', 'FightShF', 'FightSh_BWD', 'FightSh_FWD', 'FightSh_Left', 'FightSh_Right', 'flee_lkaround_01', 'FLOOR_hit', 'FLOOR_hit_f', 'fucku', 'gang_gunstand', 'gas_cwr', 'getup', 'getup_front', 'gum_eat', 'GunCrouchBwd', 'GunCrouchFwd', 'GunMove_BWD', 'GunMove_FWD', 'GunMove_L', 'GunMove_R', 'Gun_2_IDLE', 'GUN_BUTT', 'GUN_BUTT_crouch', 'Gun_stand', 'handscower', 'handsup', 'HitA_1', 'HitA_2', 'HitA_3', 'HIT_back', 'HIT_behind', 'HIT_front', 'HIT_GUN_BUTT', 'HIT_L', 'HIT_R', 'HIT_walk', 'HIT_wall', 'Idlestance_fat', 'idlestance_old', 'IDLE_armed', 'IDLE_chat', 'IDLE_csaw', 'Idle_Gang1', 'IDLE_HBHB', 'IDLE_ROCKET', 'IDLE_stance', 'IDLE_taxi', 'IDLE_tired', 'Jetpack_Idle', 'JOG_femaleA', 'JOG_maleA', 'JUMP_glide', 'JUMP_land', 'JUMP_launch', 'JUMP_launch_R', 'KART_drive', 'KART_L', 'KART_LB', 'KART_R', 'KD_left', 'KD_right', 'KO_shot_face', 'KO_shot_front', 'KO_shot_stom', 'KO_skid_back', 'KO_skid_front', 'KO_spin_L', 'KO_spin_R', 'pass_Smoke_in_car', 'phone_in', 'phone_out', 'phone_talk', 'Player_Sneak', 'Player_Sneak_walkstart', 'roadcross', 'roadcross_female', 'roadcross_gang', 'roadcross_old', 'run_1armed', 'run_armed', 'run_civi', 'run_csaw', 'run_fat', 'run_fatold', 'run_gang1', 'run_left', 'run_old', 'run_player', 'run_right', 'run_rocket', 'Run_stop', 'Run_stopR', 'Run_Wuzi', 'SEAT_down', 'SEAT_idle', 'SEAT_up', 'SHOT_leftP', 'SHOT_partial', 'SHOT_partial_B', 'SHOT_rightP', 'Shove_Partial', 'Smoke_in_car', 'sprint_civi', 'sprint_panic', 'Sprint_Wuzi', 'swat_run', 'Swim_Tread', 'Tap_hand', 'Tap_handP', 'turn_180', 'Turn_L', 'Turn_R', 'WALK_armed', 'WALK_civi', 'WALK_csaw', 'Walk_DoorPartial', 'WALK_drunk', 'WALK_fat', 'WALK_fatold', 'WALK_gang1', 'WALK_gang2', 'WALK_old', 'WALK_player', 'WALK_rocket', 'WALK_shuffle', 'WALK_start', 'WALK_start_armed', 'WALK_start_csaw', 'WALK_start_rocket', 'Walk_Wuzi', 'WEAPON_crouch', 'woman_idlestance', 'woman_run', 'WOMAN_runbusy', 'WOMAN_runfatold', 'woman_runpanic', 'WOMAN_runsexy', 'WOMAN_walkbusy', 'WOMAN_walkfatold', 'WOMAN_walknorm', 'WOMAN_walkold', 'WOMAN_walkpro', 'WOMAN_walksexy', 'WOMAN_walkshop', 'XPRESSscratch', 'WALK_armed,', 'run_player,', 'sprint_civi,' }, durum = "Special"},	

	[6]  = {isim = "Mafia Animation",  blockName = "swat",  path = "anims/swat.ifp", animations = { 'abseil', 'ARRESTgun', 'ATM', 'BIKE_elbowL', 'BIKE_elbowR', 'BIKE_fallR', 'BIKE_fall_off', 'BIKE_pickupL', 'BIKE_pickupR', 'BIKE_pullupL', 'BIKE_pullupR', 'bomber', 'CAR_alignHI_LHS', 'CAR_alignHI_RHS', 'CAR_align_LHS', 'CAR_align_RHS', 'CAR_closedoorL_LHS', 'CAR_closedoorL_RHS', 'CAR_closedoor_LHS', 'CAR_closedoor_RHS', 'CAR_close_LHS', 'CAR_close_RHS', 'CAR_crawloutRHS', 'CAR_dead_LHS', 'CAR_dead_RHS', 'CAR_doorlocked_LHS', 'CAR_doorlocked_RHS', 'CAR_fallout_LHS', 'CAR_fallout_RHS', 'CAR_getinL_LHS', 'CAR_getinL_RHS', 'CAR_getin_LHS', 'CAR_getin_RHS', 'CAR_getoutL_LHS', 'CAR_getoutL_RHS', 'CAR_getout_LHS', 'CAR_getout_RHS', 'car_hookertalk', 'CAR_jackedLHS', 'CAR_jackedRHS', 'CAR_jumpin_LHS', 'CAR_LB', 'CAR_LB_pro', 'CAR_LB_weak', 'CAR_LjackedLHS', 'CAR_LjackedRHS', 'CAR_Lshuffle_RHS', 'CAR_Lsit', 'CAR_open_LHS', 'CAR_open_RHS', 'CAR_pulloutL_LHS', 'CAR_pulloutL_RHS', 'CAR_pullout_LHS', 'CAR_pullout_RHS', 'CAR_Qjacked', 'CAR_rolldoor', 'CAR_rolldoorLO', 'CAR_rollout_LHS', 'CAR_rollout_RHS', 'CAR_shuffle_RHS', 'CAR_sit', 'CAR_sitp', 'CAR_sitpLO', 'CAR_sit_pro', 'CAR_sit_weak', 'CAR_tune_radio', 'CLIMB_idle', 'CLIMB_jump', 'CLIMB_jump2fall', 'CLIMB_jump_B', 'CLIMB_Pull', 'CLIMB_Stand', 'CLIMB_Stand_finish', 'cower', 'Crouch_Roll_L', 'Crouch_Roll_R', 'DAM_armL_frmBK', 'DAM_armL_frmFT', 'DAM_armL_frmLT', 'DAM_armR_frmBK', 'DAM_armR_frmFT', 'DAM_armR_frmRT', 'DAM_LegL_frmBK', 'DAM_LegL_frmFT', 'DAM_LegL_frmLT', 'DAM_LegR_frmBK', 'DAM_LegR_frmFT', 'DAM_LegR_frmRT', 'DAM_stomach_frmBK', 'DAM_stomach_frmFT', 'DAM_stomach_frmLT', 'DAM_stomach_frmRT', 'DOOR_LHinge_O', 'DOOR_RHinge_O', 'DrivebyL_L', 'DrivebyL_R', 'Driveby_L', 'Driveby_R', 'DRIVE_BOAT', 'DRIVE_BOAT_back', 'DRIVE_BOAT_L', 'DRIVE_BOAT_R', 'Drive_L', 'Drive_LO_l', 'Drive_LO_R', 'Drive_L_pro', 'Drive_L_pro_slow', 'Drive_L_slow', 'Drive_L_weak', 'Drive_L_weak_slow', 'Drive_R', 'Drive_R_pro', 'Drive_R_pro_slow', 'Drive_R_slow', 'Drive_R_weak', 'Drive_R_weak_slow', 'Drive_truck', 'DRIVE_truck_back', 'DRIVE_truck_L', 'DRIVE_truck_R', 'Drown', 'DUCK_cower', 'endchat_01', 'endchat_02', 'endchat_03', 'EV_dive', 'EV_step', 'facanger', 'facgum', 'facsurp', 'facsurpm', 'factalk', 'facurios', 'FALL_back', 'FALL_collapse', 'FALL_fall', 'FALL_front', 'FALL_glide', 'FALL_land', 'FALL_skyDive', 'Fight2Idle', 'FightA_1', 'FightA_2', 'FightA_3', 'FightA_block', 'FightA_G', 'FightA_M', 'FIGHTIDLE', 'FightShB', 'FightShF', 'FightSh_BWD', 'FightSh_FWD', 'FightSh_Left', 'FightSh_Right', 'flee_lkaround_01', 'FLOOR_hit', 'FLOOR_hit_f', 'fucku', 'gang_gunstand', 'gas_cwr', 'getup', 'getup_front', 'gum_eat', 'GunCrouchBwd', 'GunCrouchFwd', 'GunMove_BWD', 'GunMove_FWD', 'GunMove_L', 'GunMove_R', 'Gun_2_IDLE', 'GUN_BUTT', 'GUN_BUTT_crouch', 'Gun_stand', 'handscower', 'handsup', 'HitA_1', 'HitA_2', 'HitA_3', 'HIT_back', 'HIT_behind', 'HIT_front', 'HIT_GUN_BUTT', 'HIT_L', 'HIT_R', 'HIT_walk', 'HIT_wall', 'Idlestance_fat', 'idlestance_old', 'IDLE_armed', 'IDLE_chat', 'IDLE_csaw', 'Idle_Gang1', 'IDLE_HBHB', 'IDLE_ROCKET', 'IDLE_stance', 'IDLE_taxi', 'IDLE_tired', 'Jetpack_Idle', 'JOG_femaleA', 'JOG_maleA', 'JUMP_glide', 'JUMP_land', 'JUMP_launch', 'JUMP_launch_R', 'KART_drive', 'KART_L', 'KART_LB', 'KART_R', 'KD_left', 'KD_right', 'KO_shot_face', 'KO_shot_front', 'KO_shot_stom', 'KO_skid_back', 'KO_skid_front', 'KO_spin_L', 'KO_spin_R', 'pass_Smoke_in_car', 'phone_in', 'phone_out', 'phone_talk', 'Player_Sneak', 'Player_Sneak_walkstart', 'roadcross', 'roadcross_female', 'roadcross_gang', 'roadcross_old', 'run_1armed', 'run_armed', 'run_civi', 'run_csaw', 'run_fat', 'run_fatold', 'run_gang1', 'run_left', 'run_old', 'run_player', 'run_right', 'run_rocket', 'Run_stop', 'Run_stopR', 'Run_Wuzi', 'SEAT_down', 'SEAT_idle', 'SEAT_up', 'SHOT_leftP', 'SHOT_partial', 'SHOT_partial_B', 'SHOT_rightP', 'Shove_Partial', 'Smoke_in_car', 'sprint_civi', 'sprint_panic', 'Sprint_Wuzi', 'swat_run', 'Swim_Tread', 'Tap_hand', 'Tap_handP', 'turn_180', 'Turn_L', 'Turn_R', 'WALK_armed', 'WALK_civi', 'WALK_csaw', 'Walk_DoorPartial', 'WALK_drunk', 'WALK_fat', 'WALK_fatold', 'WALK_gang1', 'WALK_gang2', 'WALK_old', 'WALK_player', 'WALK_rocket', 'WALK_shuffle', 'WALK_start', 'WALK_start_armed', 'WALK_start_csaw', 'WALK_start_rocket', 'Walk_Wuzi', 'WEAPON_crouch', 'woman_idlestance', 'woman_run', 'WOMAN_runbusy', 'WOMAN_runfatold', 'woman_runpanic', 'WOMAN_runsexy', 'WOMAN_walkbusy', 'WOMAN_walkfatold', 'WOMAN_walknorm', 'WOMAN_walkold', 'WOMAN_walkpro', 'WOMAN_walksexy', 'WOMAN_walkshop', 'XPRESSscratch', 'WALK_armed,', 'run_player,', 'sprint_civi,' }, durum = "Special"},

	[7]  = {isim = "GTA IV Animation",  blockName = "vice",  path = "anims/vice.ifp", animations = { 'abseil', 'ARRESTgun', 'ATM', 'BIKE_elbowL', 'BIKE_elbowR', 'BIKE_fallR', 'BIKE_fall_off', 'BIKE_pickupL', 'BIKE_pickupR', 'BIKE_pullupL', 'BIKE_pullupR', 'bomber', 'CAR_alignHI_LHS', 'CAR_alignHI_RHS', 'CAR_align_LHS', 'CAR_align_RHS', 'CAR_closedoorL_LHS', 'CAR_closedoorL_RHS', 'CAR_closedoor_LHS', 'CAR_closedoor_RHS', 'CAR_close_LHS', 'CAR_close_RHS', 'CAR_crawloutRHS', 'CAR_dead_LHS', 'CAR_dead_RHS', 'CAR_doorlocked_LHS', 'CAR_doorlocked_RHS', 'CAR_fallout_LHS', 'CAR_fallout_RHS', 'CAR_getinL_LHS', 'CAR_getinL_RHS', 'CAR_getin_LHS', 'CAR_getin_RHS', 'CAR_getoutL_LHS', 'CAR_getoutL_RHS', 'CAR_getout_LHS', 'CAR_getout_RHS', 'car_hookertalk', 'CAR_jackedLHS', 'CAR_jackedRHS', 'CAR_jumpin_LHS', 'CAR_LB', 'CAR_LB_pro', 'CAR_LB_weak', 'CAR_LjackedLHS', 'CAR_LjackedRHS', 'CAR_Lshuffle_RHS', 'CAR_Lsit', 'CAR_open_LHS', 'CAR_open_RHS', 'CAR_pulloutL_LHS', 'CAR_pulloutL_RHS', 'CAR_pullout_LHS', 'CAR_pullout_RHS', 'CAR_Qjacked', 'CAR_rolldoor', 'CAR_rolldoorLO', 'CAR_rollout_LHS', 'CAR_rollout_RHS', 'CAR_shuffle_RHS', 'CAR_sit', 'CAR_sitp', 'CAR_sitpLO', 'CAR_sit_pro', 'CAR_sit_weak', 'CAR_tune_radio', 'CLIMB_idle', 'CLIMB_jump', 'CLIMB_jump2fall', 'CLIMB_jump_B', 'CLIMB_Pull', 'CLIMB_Stand', 'CLIMB_Stand_finish', 'cower', 'Crouch_Roll_L', 'Crouch_Roll_R', 'DAM_armL_frmBK', 'DAM_armL_frmFT', 'DAM_armL_frmLT', 'DAM_armR_frmBK', 'DAM_armR_frmFT', 'DAM_armR_frmRT', 'DAM_LegL_frmBK', 'DAM_LegL_frmFT', 'DAM_LegL_frmLT', 'DAM_LegR_frmBK', 'DAM_LegR_frmFT', 'DAM_LegR_frmRT', 'DAM_stomach_frmBK', 'DAM_stomach_frmFT', 'DAM_stomach_frmLT', 'DAM_stomach_frmRT', 'DOOR_LHinge_O', 'DOOR_RHinge_O', 'DrivebyL_L', 'DrivebyL_R', 'Driveby_L', 'Driveby_R', 'DRIVE_BOAT', 'DRIVE_BOAT_back', 'DRIVE_BOAT_L', 'DRIVE_BOAT_R', 'Drive_L', 'Drive_LO_l', 'Drive_LO_R', 'Drive_L_pro', 'Drive_L_pro_slow', 'Drive_L_slow', 'Drive_L_weak', 'Drive_L_weak_slow', 'Drive_R', 'Drive_R_pro', 'Drive_R_pro_slow', 'Drive_R_slow', 'Drive_R_weak', 'Drive_R_weak_slow', 'Drive_truck', 'DRIVE_truck_back', 'DRIVE_truck_L', 'DRIVE_truck_R', 'Drown', 'DUCK_cower', 'endchat_01', 'endchat_02', 'endchat_03', 'EV_dive', 'EV_step', 'facanger', 'facgum', 'facsurp', 'facsurpm', 'factalk', 'facurios', 'FALL_back', 'FALL_collapse', 'FALL_fall', 'FALL_front', 'FALL_glide', 'FALL_land', 'FALL_skyDive', 'Fight2Idle', 'FightA_1', 'FightA_2', 'FightA_3', 'FightA_block', 'FightA_G', 'FightA_M', 'FIGHTIDLE', 'FightShB', 'FightShF', 'FightSh_BWD', 'FightSh_FWD', 'FightSh_Left', 'FightSh_Right', 'flee_lkaround_01', 'FLOOR_hit', 'FLOOR_hit_f', 'fucku', 'gang_gunstand', 'gas_cwr', 'getup', 'getup_front', 'gum_eat', 'GunCrouchBwd', 'GunCrouchFwd', 'GunMove_BWD', 'GunMove_FWD', 'GunMove_L', 'GunMove_R', 'Gun_2_IDLE', 'GUN_BUTT', 'GUN_BUTT_crouch', 'Gun_stand', 'handscower', 'handsup', 'HitA_1', 'HitA_2', 'HitA_3', 'HIT_back', 'HIT_behind', 'HIT_front', 'HIT_GUN_BUTT', 'HIT_L', 'HIT_R', 'HIT_walk', 'HIT_wall', 'Idlestance_fat', 'idlestance_old', 'IDLE_armed', 'IDLE_chat', 'IDLE_csaw', 'Idle_Gang1', 'IDLE_HBHB', 'IDLE_ROCKET', 'IDLE_stance', 'IDLE_taxi', 'IDLE_tired', 'Jetpack_Idle', 'JOG_femaleA', 'JOG_maleA', 'JUMP_glide', 'JUMP_land', 'JUMP_launch', 'JUMP_launch_R', 'KART_drive', 'KART_L', 'KART_LB', 'KART_R', 'KD_left', 'KD_right', 'KO_shot_face', 'KO_shot_front', 'KO_shot_stom', 'KO_skid_back', 'KO_skid_front', 'KO_spin_L', 'KO_spin_R', 'pass_Smoke_in_car', 'phone_in', 'phone_out', 'phone_talk', 'Player_Sneak', 'Player_Sneak_walkstart', 'roadcross', 'roadcross_female', 'roadcross_gang', 'roadcross_old', 'run_1armed', 'run_armed', 'run_civi', 'run_csaw', 'run_fat', 'run_fatold', 'run_gang1', 'run_left', 'run_old', 'run_player', 'run_right', 'run_rocket', 'Run_stop', 'Run_stopR', 'Run_Wuzi', 'SEAT_down', 'SEAT_idle', 'SEAT_up', 'SHOT_leftP', 'SHOT_partial', 'SHOT_partial_B', 'SHOT_rightP', 'Shove_Partial', 'Smoke_in_car', 'sprint_civi', 'sprint_panic', 'Sprint_Wuzi', 'swat_run', 'Swim_Tread', 'Tap_hand', 'Tap_handP', 'turn_180', 'Turn_L', 'Turn_R', 'WALK_armed', 'WALK_civi', 'WALK_csaw', 'Walk_DoorPartial', 'WALK_drunk', 'WALK_fat', 'WALK_fatold', 'WALK_gang1', 'WALK_gang2', 'WALK_old', 'WALK_player', 'WALK_rocket', 'WALK_shuffle', 'WALK_start', 'WALK_start_armed', 'WALK_start_csaw', 'WALK_start_rocket', 'Walk_Wuzi', 'WEAPON_crouch', 'woman_idlestance', 'woman_run', 'WOMAN_runbusy', 'WOMAN_runfatold', 'woman_runpanic', 'WOMAN_runsexy', 'WOMAN_walkbusy', 'WOMAN_walkfatold', 'WOMAN_walknorm', 'WOMAN_walkold', 'WOMAN_walkpro', 'WOMAN_walksexy', 'WOMAN_walkshop', 'XPRESSscratch', 'WALK_armed,', 'run_player,', 'sprint_civi,' }, durum = "Special"},

	[8]  = {isim = "Posture Position I",  blockName = "lean",  path = "anims/gangs.ifp", animations = { "leanIDLE"}, durum = "Normal"},

	[9]  = {isim = "Posture Position II",  blockName = "merci",  path = "anims/merto.ifp", animations = { "RAP_A_Loop"}, durum = "Normal"},

	[10]  = {isim = "Posture Position III",  blockName = "test31",  path = "anims/misc.ifp", animations = { "DEALER_IDLE"}, durum = "Normal"},

	[11]  = {isim = "Posture Position IV",  blockName = "mertis",  path = "anims/amcik.ifp", animations = { "Plyrlean_loop"}, durum = "Normal"},

	[12]  = {isim = "Posture Position V",  blockName = "eads",  path = "anims/mero.ifp", animations = { "wtchrace_in"}, durum = "Normal"},

	[13]  = {isim = "Sitting Animation I",  blockName = "otur",  path = "anims/beach.ifp", animations = { "Lay_Bac_Loop"}, durum = "Normal"},

	[14]  = {isim = "Sitting Animation II",  blockName = "mama",  path = "anims/beachh.ifp", animations = { "ParkSit_M_loop"}, durum = "Normal"},

	[15]  = {isim = "Sitting Animation III",  blockName = "mertola",  path = "animS/camera.ifp", animations = { "camcrch_cmon"}, durum = "Normal"},

	[16]  = {isim = "Smoking Animation",  blockName = "test",  path = "anims/otb.ifp", animations = { "M_smklean_loop"}, durum = "Normal"},

	[17]  = {isim = "Salute Stance Animation",  blockName = "selam",  path = "anims/ghands.ifp", animations = { "gsign5LH"}, durum = "Normal"},

}









function panel ()



       arkaplan = guiCreateWindow(sx/2-250, sy/2-150, 350, 458, "Los Santos Roleplay - Animation System © 2020", false)

        guiWindowSetSizable(arkaplan, false)



        tabpanel = guiCreateTabPanel(10,30,530,330,false, arkaplan)

		tab3 = guiCreateTab("((Animation Pack))", tabpanel)

		

		

		liste  = guiCreateGridList(0+15,15,300,270,false,tab3)

		guiGridListSetSortingEnabled(liste, false)

		guiGridListAddColumn(liste, "ID", 0.15)

		guiGridListAddColumn(liste, "Animation Name", 0.60)

		guiGridListAddColumn(liste, "Type", 0.65)

		

		--if not getElementData(localPlayer, "animasyon:buton") then

	 abuton = guiCreateButton(4,370,350,32,"Use Animation",false,arkaplan)

		--guiler[8] = guiCreateButton(4,450,350,30,"Animasyon Durdur !",false,arkaplan)

	 kbuton = guiCreateButton(4,370+45,350,30,"Close",false,arkaplan)

		listekle ()

       

end 

bindKey("F4", "down",
function() 
	if not guiGetVisible( arkaplan ) then
panel()
	end
end)



function listekle ()

	for k, v in ipairs(animasyonlar) do

		local row = guiGridListAddRow(liste)

		guiGridListSetItemText(liste, row, 1, k, false, false)

		guiGridListSetItemText(liste, row, 2, v.isim, false, false)

		guiGridListSetItemText(liste, row, 3, v.durum, false, false)

		if v.durum == "Normal" then

		guiGridListSetItemColor ( liste, row, 3, 0,255,0 )

		else

		guiGridListSetItemColor ( liste, row, 3, 255,0,0)

		end

	end

end



setElementData(localPlayer, "dans",nil)

deger = nil



addEvent("animasyon2", true)

addEventHandler("animasyon2",root, function  (oyuncu, sira,  durum )



local deger2 = tonumber ( sira )

if durum ==  "animboz" then

	if tonumber(sira) == 0 then

		setElementData(oyuncu, "dans", nil)

		setElementData(oyuncu, "dans2", nil)

		setPedAnimation(oyuncu)

		engineRestoreAnimation ( oyuncu, "ped" )

		outputChatBox("#EDA2FFAnimation: #ffffffPhysics animation restored.",0,255,0,true)

	end

end

	if durum == "Special" then

		for kk, vv in ipairs(animasyonlar[deger2].animations) do

		 setElementData(oyuncu, "dans", nil)

		 engineReplaceAnimation ( oyuncu, "ped", animasyonlar[deger2].animations[kk], animasyonlar[deger2].blockName, animasyonlar[deger2].animations[kk] )

		end

	end

	if durum ==  "Normal" then

 

    if not sira then return end 

	for k,v in ipairs(animasyonlar) do

		if k == deger2 then

		



			setElementData(oyuncu, "dans", nil)

			setElementData(oyuncu, "dans2", true)

			setPedAnimation (oyuncu, v.blockName, animasyonlar[k].animations[1])

			end

		end

	end

end)



bindKey("space", "down",function()

	if getElementData(localPlayer, "dans2") then

	setElementData(localPlayer, "dans2", nil)

	triggerServerEvent("animasyonbitir", root, localPlayer, 0)

	end

end)



addEventHandler("onClientResourceStart", resourceRoot, function ( startedRes )

	for k,v in  ipairs(animasyonlar) do

        ifpler = engineLoadIFP (v.path, v.blockName)

        if ifpler then 

            print ("Successfully IFP Installed. :"..v.path)

        else

            print ("Sorry IFP Not Uploaded "..v.path)

        end

	end

end)



addEventHandler( "onClientGUIClick", resourceRoot,

    function ( button, state )

        if button == "left" and state == "up" then 

		if source == kbuton then

			

				destroyElement(arkaplan)

			

		end

		if source == guiler[8]  then

		setElementData(localPlayer, "animasyon:buton", nil)

		setElementData(oyuncu, "dans2", nil)

		triggerServerEvent("finish animation", root, localPlayer, 0)

		end

		if source == abuton then

		if guiGetText(abuton) == ">> Use Animation" then -- Animasyon Kullan

		 local siraCek = guiGridListGetSelectedItem(liste)

		 local isimCek = guiGridListGetItemText(liste, siraCek, 1)

		 local animasyon = guiGridListGetItemText(liste, siraCek, 2)

		 local isimCek2 = guiGridListGetItemText(liste, siraCek, 3)

		 local durum = guiGridListGetItemText(liste, siraCek, 4)

		if isimCek then

			deger = isimCek

			if isPedInVehicle ( localPlayer ) then

outputChatBox("#EDA2FFAnimation: #ffffffSorry, you cannot use Animation in the vehicle..",255,0,0,true)

return end

			outputChatBox("#EDA2FFAnimation: #ffffffYou have successfully selected a new animation. ("..animasyon..")",0,255,0,true)

			if guiGetText(abuton) == ">> Use Animation" then

			guiSetText(abuton, "<< Stop Animation")

			 --guiSetProperty (abuton, "NormalTextColour", "FFff0000")

			else

			guiSetText(abuton, ">> Use Animation")

		end

			setElementData(localPlayer, "dans",true)

            triggerServerEvent("animasyonyap", localPlayer, isimCek, isimCek2)

			end

			else

			guiSetText(abuton, ">> Use Animation")

			--guiSetProperty (abuton, "NormalTextColour", "FFFFFFFF")

			triggerServerEvent("animasyonbitir", localPlayer, localPlayer)

		end

		end

     end

 end)

 