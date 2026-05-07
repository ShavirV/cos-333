father(bill, jake).
father(bill, shelley).
father(jake, ted).
father(ron, liz).
mother(mary, jake).
mother(mary, shelley).
mother(janet, ted).
mother(shelley, liz).

% at least one common parent to be siblings. and cannot be the same
% person
sibling(A,B) :- mother(X,A),mother(X,B), A\=B.
sibling(A,B) :- father(X,A),father(X,B), A\=B.

%at least one parent of X is siblings with Y
nephewNiece(X,Y) :- mother(A,X),sibling(A,Y).
nephewNiece(X,Y) :- father(A,X),sibling(A,Y).
