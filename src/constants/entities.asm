; Maximum number of loaded entities
MAX_ENTITIES equ 16

; End marker in a list of entities
ENTITIES_END equ $FF

; Values for wEntitiesStatusTable
ENTITY_STATUS_DISABLED   equ 0
ENTITY_STATUS_DYING      equ 1
ENTITY_STATUS_FALLING    equ 2
ENTITY_STATUS_DESTROYING equ 3
ENTITY_STATUS_INIT       equ 4
ENTITY_STATUS_ACTIVE     equ 5
ENTITY_STATUS_STUNNED    equ 6
ENTITY_STATUS_LIFTED     equ 7
ENTITY_STATUS_THROWN     equ 8

; Values for wEntitiesTypeTable
; (See also EntityPointersTable)
ENTITY_ARROW                         equ $00
ENTITY_BOOMERANG                     equ $01
ENTITY_BOMB                          equ $02
ENTITY_HOOKSHOT_CHAIN                equ $03
ENTITY_HOOKSHOT_HIT                  equ $04
ENTITY_ENTITY_LIFTABLE_ROCK          equ $05
ENTITY_PUSHED_BLOCK                  equ $06
ENTITY_CHEST_WITH_ITEM               equ $07
ENTITY_MAGIC_POWDER_SPRINKLE         equ $08
ENTITY_OCTOROCK                      equ $09
ENTITY_OCTOROCK_ROCK                 equ $0A
ENTITY_MOBLIN                        equ $0B
ENTITY_MOBLIN_ARROW                  equ $0C
ENTITY_TEKTITE                       equ $0D
ENTITY_LEEVER                        equ $0E
ENTITY_ARMOS_STATUE                  equ $0F
ENTITY_HIDING_GHINI                  equ $10
ENTITY_GIANT_GHINI                   equ $11
ENTITY_GHINI                         equ $12
ENTITY_BROKEN_HEART_CONTAINER        equ $13 ; Killable; crashes the game if you run into it; works if you use the Magic Powder on it
ENTITY_MOBLIN_SWORD                  equ $14
ENTITY_ANTI_FAIRY                    equ $15
ENTITY_SPARK_COUNTER_CLOCKWISE       equ $16
ENTITY_SPARK_CLOCKWISE               equ $17
ENTITY_POLS_VOICE                    equ $18
ENTITY_KEESE                         equ $19
ENTITY_STALFOS_AGGRESSIVE            equ $1A
ENTITY_GEL                           equ $1B
ENTITY_MINI_GEL                      equ $1C
;ENTITY_DISABLED                     equ $1D
ENTITY_STALFOS_EVASIVE               equ $1E
ENTITY_GIBDO                         equ $1F
ENTITY_HARDHAT_BEETLE                equ $20
ENTITY_WIZROBE                       equ $21
ENTITY_WIZROBE_PROJECTILE            equ $22
ENTITY_LIKE_LIKE                     equ $23
ENTITY_IRON_MASK                     equ $24
ENTITY_SMALL_EXPLOSION_ENEMY         equ $25
ENTITY_SMALL_EXPLOSION_ENEMY_2       equ $26
ENTITY_SPIKE_TRAP                    equ $27
ENTITY_MIMIC                         equ $28
ENTITY_MINI_MOLDORM                  equ $29
ENTITY_LASER                         equ $2A
ENTITY_LASER_BEAM                    equ $2B
ENTITY_SPIKED_BEETLE                 equ $2C
ENTITY_DROPPABLE_HEART               equ $2D
ENTITY_DROPPABLE_RUPEE               equ $2E
ENTITY_DROPPABLE_FAIRY               equ $2F
ENTITY_KEY_DROP_POINT                equ $30
ENTITY_SWORD                         equ $31
;ENTITY_UNKNOWN                      equ $32
ENTITY_PIECE_OF_POWER                equ $33
ENTITY_GUARDIAN_ACORN                equ $34
ENTITY_HEART_PIECE                   equ $35
ENTITY_HEART_CONTAINER               equ $36
ENTITY_DROPPABLE_ARROWS              equ $37
ENTITY_DROPPABLE_BOMBS               equ $38
ENTITY_INSTRUMENT_OF_THE_SIRENS      equ $39
ENTITY_SLEEPY_TOADSTOOL              equ $3A
ENTITY_DROPPABLE_MAGIC_POWDER        equ $3B
;ENTITY_HIDING_SLIME_KEY?            equ $3C
ENTITY_DROPPABLE_SECRET_SEASHELL     equ $3D
ENTITY_MARIN                         equ $3E
ENTITY_RACOON                        equ $3F
ENTITY_WITCH                         equ $40
ENTITY_OWL_EVENT                     equ $41
ENTITY_OWL_STATUE                    equ $42
ENTITY_SEASHELL_MANSION_TREES        equ $43
ENTITY_YARNA_TALKING_BONES           equ $44
ENTITY_BOULDERS                      equ $45
ENTITY_MOVING_BLOCK_LEFT_TOP         equ $46
ENTITY_MOVING_BLOCK_LEFT_BOTTOM      equ $47
ENTITY_MOVING_BLOCK_BOTTOM_LEFT      equ $48
ENTITY_MOVING_BLOCK_BOTTOM_RIGHT     equ $49
ENTITY_COLOR_DUNGEON_BOOK            equ $4A
ENTITY_POT                           equ $4B
;ENTITY_DISABLED                     equ $4C
ENTITY_SHOP_OWNER                    equ $4D
;ENTITY_UNKNOWN                      equ $4E
ENTITY_TRENDY_GAME_OWNER             equ $4F
ENTITY_BOO_BUDDY                     equ $50
ENTITY_KNIGHT                        equ $51
ENTITY_TRACTOR_DEVICE                equ $52
ENTITY_TRACTOR_DEVICE_REVERSE        equ $53
ENTITY_FISHERMAN_FISHING_GAME        equ $54
ENTITY_BOUNCING_BOMBITE              equ $55
ENTITY_TIMER_BOMBITE                 equ $56
ENTITY_PAIRODD                       equ $57
;ENTITY_UNKNOWN                      equ $58
ENTITY_MOLDORM                       equ $59
ENTITY_FACADE                        equ $5A
ENTITY_SLIME_EYE                     equ $5B
ENTITY_GENIE                         equ $5C
ENTITY_SLIME_EEL                     equ $5D
ENTITY_GHOMA                         equ $5E
ENTITY_MASTER_STALFOS                equ $5F
ENTITY_DODONGO_SNAKE                 equ $60
ENTITY_WARP                          equ $61
ENTITY_HOT_HEAD                      equ $62
ENTITY_EVIL_EAGLE                    equ $63
;ENTITY_UNKOWN (weird split screen)  equ $64
ENTITY_ANGLER_FISH                   equ $65
ENTITY_CRYSTAL_SWITCH                equ $66
;ENTITY_UNKNOWN                      equ $67
;ENTITY_WEIRD_TILE_OVERWRITING       equ $68
ENTITY_MOVING_BLOCK_MOVER            equ $69
ENTITY_RAFT_RAFT_OWNER               equ $6A
ENTITY_TEXT_DEBUGGER                 equ $6B
ENTITY_CUCCO                         equ $6C
ENTITY_BOW_WOW                       equ $6D
ENTITY_BUTTERFLY                     equ $6E
ENTITY_DOG                           equ $6F
ENTITY_KID_70                        equ $70
ENTITY_KID_71                        equ $71
ENTITY_KID_72                        equ $72
ENTITY_KID_73                        equ $73
ENTITY_PAPAHLS_WIFE                  equ $74
ENTITY_GRANDMA_ULRIRA                equ $75
ENTITY_MR_WRITE                      equ $76
ENTITY_GRANDPA_ULRIRA                equ $77
ENTITY_YIP_YIP                       equ $78
ENTITY_MADAM_MEOWMEOW                equ $79
ENTITY_CROW                          equ $7A
ENTITY_CRAZY_TRACY                   equ $7B
ENTITY_GIANT_GOPONGA_FLOWER          equ $7C
ENTITY_GOPONGA_FLOWER_PROJECTILE     equ $7D
ENTITY_GOPONGA_FLOWER                equ $7E
ENTITY_TURTLE_ROCK_HEAD              equ $7F
ENTITY_TELEPHONE                     equ $80
ENTITY_ROLLING_BONES                 equ $81
ENTITY_ROLLING_BONES_BAR             equ $82
ENTITY_DREAM_SHRINE_BED              equ $83
ENTITY_BIG_FAIRY                     equ $84
ENTITY_MR_WRITES_BIRD                equ $85
ENTITY_FLOATING_ITEM                 equ $86
ENTITY_DESERT_LANMOLA                equ $87
ENTITY_ARMOS_KNIGHT                  equ $88
ENTITY_HINOX                         equ $89
ENTITY_TILE_GLINT_SHOWN              equ $8A
ENTITY_TILE_GLINT_HIDDEN             equ $8B
;ENTITY_UNKNOWN (lands slowly)       equ $8C
;ENTITY_UNKNOWN (lands slowly)       equ $8D
ENTITY_CUE_BALL                      equ $8E
ENTITY_MASKED_MIMIC_GORIYA           equ $8F
ENTITY_THREE_OF_A_KIND               equ $90
ENTITY_ANTI_KIRBY                    equ $91
ENTITY_SMASHER                       equ $92
ENTITY_MAD_BOMBER                    equ $93
ENTITY_KANALET_BOMBABLE_WALL         equ $94
ENTITY_RICHARD                       equ $95
ENTITY_RICHARD_FROG                  equ $96
;ENTITY_UNKOWN (diving warp event?)  equ $97
ENTITY_HORSE_PIECE                   equ $98
ENTITY_WATER_TEKTITE                 equ $99
ENTITY_FLYING_TILES                  equ $9A
ENTITY_HIDING_GEL                    equ $9B
ENTITY_STAR                          equ $9C
ENTITY_LIFTABLE_STATUE               equ $9D
ENTITY_FIREBALL_SHOOTER              equ $9E
ENTITY_GOOMBA                        equ $9F
ENTITY_PEAHAT                        equ $A0
ENTITY_SNAKE                         equ $A1
ENTITY_PIRANHA_PLANT                 equ $A2
ENTITY_SIDE_VIEW_PLATFORM_HORIZONTAL equ $A3
ENTITY_SIDE_VIEW_PLATFORM_VERTICAL   equ $A4
ENTITY_SIDE_VIEW_PLATFORM            equ $A5
ENTITY_SIDE_VIEW_WEIGHTS             equ $A6
ENTITY_SMASHABLE_PILLAR              equ $A7
;ENTITY_UNKNOWN                      equ $A8
ENTITY_BLOOPER                       equ $A9
ENTITY_CHEEP_CHEEP_HORIZONTAL        equ $AA
ENTITY_CHEEP_CHEEP_VERTICAL          equ $AB
ENTITY_CHEEP_CHEEP_JUMPING           equ $AC
ENTITY_KIKI_THE_MONKEY               equ $AD
ENTITY_WINGED_OCTOROK                equ $AE
ENTITY_TRADING_ITEM                  equ $AF
ENTITY_PINCER                        equ $B0
ENTITY_HOLE_FILLER                   equ $B1
ENTITY_BEETLE_SPAWNER                equ $B2
ENTITY_HONEYCOMB                     equ $B3
ENTITY_TARIN                         equ $B4
ENTITY_BEAR                          equ $B5
ENTITY_PAPAHL                        equ $B6
ENTITY_MERMAID                       equ $B7
ENTITY_FISHERMAN_UNDER_BRIDGE        equ $B8
ENTITY_BUZZ_BLOB                     equ $B9
ENTITY_BOMBER                        equ $BA
ENTITY_BUSH_CRAWLER                  equ $BB
ENTITY_GRIM_CREEPER                  equ $BC
ENTITY_VIRE                          equ $BD
ENTITY_BLAINO                        equ $BE
ENTITY_ZOMBIE                        equ $BF
ENTITY_MAZE_SIGNPOST                 equ $C0
ENTITY_MARIN_AT_THE_SHORE            equ $C1
ENTITY_MARIN_AT_TAL_TAL_HEIGHTS      equ $C2
ENTITY_MAMU_AND_FROGS                equ $C3
ENTITY_WALRUS                        equ $C4
ENTITY_URCHIN                        equ $C5
ENTITY_SAND_CRAB                     equ $C6
ENTITY_MANBO_AND_FISHES              equ $C7
ENTITY_BUNNY_CALLING_MARIN           equ $C8
ENTITY_MUSICAL_NOTE                  equ $C9
ENTITY_MAD_BATTER                    equ $CA
ENTITY_ZORA                          equ $CB
ENTITY_FISH                          equ $CC
ENTITY_BANANAS_SCHULE_SALE           equ $CD
ENTITY_MERMAID_STATUE                equ $CE
ENTITY_SEASHELL_MANSION              equ $CF
ENTITY_ANIMAL_D0                     equ $D0
ENTITY_ANIMAL_D1                     equ $D1
ENTITY_ANIMAL_D2                     equ $D2
ENTITY_BUNNY_D3                      equ $D3
;ENTITY_UNKNOWN                      equ $D4
;ENTITY_UNKNOWN                      equ $D5
ENTITY_SIDE_VIEW_POT                 equ $D6
ENTITY_THWIMP                        equ $D7
ENTITY_THWOMP                        equ $D8
ENTITY_THWOMP_RAMMABLE               equ $D9
ENTITY_PODOBOO                       equ $DA
ENTITY_GIANT_BUBBLE                  equ $DB
ENTITY_FLYING_ROOSTER_EVENTS         equ $DC
ENTITY_BOOK                          equ $DD
ENTITY_EGG_SONG_EVENT                equ $DE
ENTITY_SWORD_BEAM                    equ $DF
ENTITY_MONKEY                        equ $E0
ENTITY_WITCH_RAT                     equ $E1
ENTITY_FLAME_SHOOTER                 equ $E2
ENTITY_POKEY                         equ $E3
ENTITY_MOBLIN_KING                   equ $E4
ENTITY_FLOATING_ITEM_2               equ $E5
ENTITY_FINAL_NIGHTMARE               equ $E6
ENTITY_KANALET_CASTLE_GATE_SWITCH    equ $E7
ENTITY_ENDING_OWL_STAIR_CLIMBING     equ $E8
ENTITY_COLOR_SHELL_RED               equ $E9
ENTITY_COLOR_SHELL_GREEN             equ $EA
ENTITY_COLOR_SHELL_BLUE              equ $EB
ENTITY_COLOR_GHOUL_RED               equ $EC
ENTITY_COLOR_GHOUL_GREEN             equ $ED
ENTITY_COLOR_GHOUL_BLUE              equ $EE
ENTITY_ROTOSWITCH_RED                equ $EF
ENTITY_ROTOSWITCH_YELLOW             equ $F0
ENTITY_ROTOSWITCH_BLUE               equ $F1
ENTITY_FLYING_HOPPER_BOMBS           equ $F2
ENTITY_HOPPER                        equ $F3
ENTITY_AVALAUNCH                     equ $F4
ENTITY_BOUNCING_BOULDER              equ $F5
ENTITY_COLOR_GUARDIAN_BLUE           equ $F6
ENTITY_COLOR_GUARDIAN_RED            equ $F7
ENTITY_GIANT_BUZZ_BLOB               equ $F8
ENTITY_HARDHIT_BEETLE                equ $F9
ENTITY_PHOTOGRAPHER                  equ $FA
; unused                             equ $FB
; unused                             equ $FC
; unused                             equ $FD
; unused                             equ $FE
; unused                             equ $FF
