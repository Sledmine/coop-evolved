(script static "void" test_looking_tech
    (print "Looking for tech")
)

(script static "void" test
    (if (= hard (game_difficulty_get_real))
        (begin
            (test_looking_tech)
            (sleep 30)
            (test_looking_tech)
        )
        (begin
            (ai_place airlock_1_anti/boarding)
            (ai_place airlock_2_anti/boarding)
        )
    )
)