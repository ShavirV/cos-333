%remove zero values and replace all others with absolutes

absPositivesNegatives([],[]).

absPositivesNegatives([0|T1],[L2]) :-
    absPositivesNegatives(T1, L2).

absPositivesNegatives([H|T1], [H|T2]) :-
    H > 0,
    absPositivesNegatives(T1,T2).

absPositivesNegatives([H1|T1],[H2|T2]) :-
    H1 < 0,
    H2 is -H1,
    absPositivesNegatives(T1,T2).
