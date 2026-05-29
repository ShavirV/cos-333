%base, empty list equivalent
absPositivesNegatives([], []).

%see a positive at head, check rest of list
absPositivesNegatives([H | L1], [H | L2]) :- H > 0, absPositivesNegatives(L1, L2).

%see a negative in Head L1, check that L2 has abs
absPositivesNegatives([H | L1], [X | L2]) :- H < 0, X is 0 - H, absPositivesNegatives(L1, L2).

%skip zero values
absPositivesNegatives([H | L1], L2) :- H =:= 0, absPositivesNegatives(T, R).
