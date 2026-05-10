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


%True if two routers are directly connected or connected through one other
routersConnected(X,Y) :-
    router(X),
    router(Y),
    connected(X,Y).

routersConnected(X,Y) :-
    router(X),
    router(Y),
    connected(X,Z),
    connected(Z,Y),
    router(Z),
    X \= Y.

computerConnectedToRouter(X,Y) :-
    computer(X),
    router(Y),
    connected(X,Y).

computersConnected(X,Y) :-
    computer(X),
    computer(Y),
    connected(X,Y).

computersConnected(X,Y) :-
    computerConnectedToRouter(X,R),
    computerConnectedToRouter(Y,R),
    X \= Y.

computersConnected(X,Y) :-
    computerConnectedToRouter(X,R1),
    computerConnectedToRouter(Y,R2),
    routersConnected(R1,R2),
    X \= Y.


%Task 2:
getValuesGreaterThan(_, [], []).

getValuesGreaterThan(N, [H|T], [H|R]) :-
    H > N,
    getValuesGreaterThan(N, T, R).

getValuesGreaterThan(N, [H|T], R) :-
    H =< N,
    getValuesGreaterThan(N, T, R).


%Task 3:

countConsecutivePairs([], 0).
countConsecutivePairs([_], 0).

/* pair found */
countConsecutivePairs([X,X|T], N) :-
    countConsecutivePairs(T, N1),
    N is N1 + 1.

/* no pair at start */
countConsecutivePairs([X,Y|T], N) :-
    X \= Y,
    countConsecutivePairs([Y|T], N).