(global "boolean" global_dialog_on false)
(global "boolean" global_first_wave false)

(script static "string" looking_for_something_else
    (print "3.- Looking for something else")
    (sleep 30)
    (print "4.- Something else found")
    (tostring "returned")
)

(script static "void" test_looking_tech
    (print "1.- Looking for tech")
    (sleep 30)
    (print "2.- Tech found")
    (looking_for_something_else)
    (sleep_until global_dialog_on)
    (sleep_until (or global_first_wave (and (!= (game_difficulty_get )normal )global_dialog_on ) ) )
)

(script static "void" test
    (test_looking_tech)
    (sleep 30)
    (print "5.- Test done")
)