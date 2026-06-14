computer(pc1).
computer(pc2).
computer(pc3).
computer(pc4).
computer(pc5).
computer(pc6).
router(router1).
router(router2).
router(router3).
connection(pc1, router1).
connection(router1, pc2).
connection(router1, router2).
connection(router3, router2).
connection(router2, pc3).
connection(pc4, router3).
connection(pc5, pc6).

%bidirectional connection
connected(X,Y) :- connection(X,Y).
connected(X,Y) :- connection(Y,X).

routersConnected(X,Y) :- router(X), router(Y), connected(X,Y).
routersConnected(X,Y) :- router(X), router(Y), router(Z),
                         connected(X,Z), connected(Z,Y), X \= Y.

computerConnectedToRouter(X,Y) :- computer(X), router(Y), connected(X,Y).

computersConnected(X,Y) :- computer(X), computer(Y), connected(X,Y).
computersConnected(X,Y) :- computer(X), computer(Y),
                           computerConnectedToRouter(X,Z),
                           computerConnectedToRouter(Y,Z),
                           X \= Y.
computersConnected(X,Y) :- computer(X), computer(Y),
                           computerConnectedToRouter(X,R1),
                           computerConnectedToRouter(Y,R2),
                           routersConnected(R1, R2), X \= Y.

%task 2

%base case, empty list
getValuesGreaterThan(_, [], []).
% case head greater than N: should be in the second list as well and
% recurse
getValuesGreaterThan(N, [H|T], [H|T2]) :-
    H > N,
    getValuesGreaterThan(N, T, T2).

getValuesGreaterThan(N, [H|T], T2) :-
    H =< N,
    getValuesGreaterThan(N, T, T2).


%base, empty has zero, and if one index left, also 0
countConsecutivePairs([], 0).
countConsecutivePairs([_], 0).
countConsecutivePairs([H,H|T],N) :-
    countConsecutivePairs(T,N1),
    N is N1 + 1.
countConsecutivePairs([A,B|T],N) :-
    A \= B,
    countConsecutivePairs(T,N).

