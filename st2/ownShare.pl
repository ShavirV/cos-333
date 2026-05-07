tenant(alice, tony).
tenant(tom, jane).
tenant(joe, tony).
tenant(mary, jane).
address(alice, pineStreet12).
address(tom, shillingLane15).
address(joe, duncanRoad6).
address(mary, shillingLane15).
address(jonathan, pineStreet12).

%share if same address and not the same person
share(X,Y) :- address(X,A),address(Y,A), X\=Y.
%exist distinct tenants that share an address
ownSharedProperty(X) :- tenant(Y,X),tenant(Z,X),share(Y,Z).
