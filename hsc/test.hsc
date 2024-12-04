
(if (= hard (game_difficulty_get_real))
    (begin
        (hangar_cryo)
        (test_looking_tech)
    )
    (begin
        (ai_place airlock_1_anti/boarding)
        (ai_place airlock_2_anti/boarding)
    )
)

