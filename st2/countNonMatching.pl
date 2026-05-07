%base case, empty list has 0 non matches
countNonMatching(_,[],0).

%found a match, ignore and continue
countNonMatching(E,[E|L],C) :- countNonMatching(E,L,C).

%found a non match 'increment' backwards and recurse
countNonMatching(E,[F|L],C) :- E\=L, countNonMatching(E,L,D), C is D+1

