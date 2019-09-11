% Question 1:
% The first two examples both have their first definitions of an ancestor as the 'base case' for lack of a better term.
% They both, at first, say that X is an ancestor of Y if X is a parent of Y. This makes sense because it is the
% simplest form of an ancestor, a parent. The first two examples differ in their second definition of an ancestor.
% The first one goes on to state that X is an ancestor of Y if 'some person' (Z) is a parent of Y AND X is an ancestor of
% 'some person'. The second one states that X is an ancestor of Y if X is the parent of 'some person' (Z) AND 'some person'
% is the ancestor of Y. An english representation of the difference between the first two might be that the first one checks
% if X is the ancestor of one of Y's parents where as the second one checks if X is one of the parents of one of Y's
% ancestors. These first two are functionally equivalent.

% The third one differs in a couple ways. It's 'base case' is not only defined differently but also ordered differently.
% The first two put their base case before their recursive definitions where as the third one puts its base case after its
% definition. The third one defines its base case as someone is their own ancestor (I do not think that is accurate but that 
% is beyond the scope of the question). The difference between the first two examples and the third is best illustrated by 
% asking prolog if bill or mary or anyone is their own ancestor (ancestor(bill,bill)). The first two will say this is false.
% The third will say it is true.

% Question 2:
male(bill).
male(bob).
male(mike).
male(rich).
male(sam).

female(mary).
female(kathy).
female(patty).
female(susan).

parent(mary, bill).
parent(bob, bill).
parent(kathy, mary).
parent(mike, mary).
parent(patty, bob).
parent(rich, bob).
parent(susan, rich).
parent(sam, rich).
% I made rich and kathy siblings so I could have a set of cousins (bob and mary) in my facts
parent(susan, kathy).
parent(sam, kathy).

% grandparent/2 - X is a grandparent of Y if X is the parent of Z such that Z is the parent of Y
grandparent(X,Y) :- parent(X,Z), parent(Z,Y).

% grandfather/2 - X is the grandfather of Y if X is male AND X is the grandparent of Y
grandfather(X,Y) :- male(X), grandparent(X,Y).

% grandmother/2 - X is the grandmother of Y if X is female AND X is the grandparent of Y
grandmother(X,Y) :- female(X), grandparent(X,Y).

% paternal_grandfather/2 - X is the paternal grandfather of Y if X is male AND X is the parent of Z such that Z is the parent of Y and Z is male
paternal_grandfather(X,Y) :- male(X), parent(X,Z), parent(Z,Y), male(Z).

% maternal_grandfather/2 - X is the maternal grandfather of Y if X is male AND X is the parent of Z such that Z is the parent of Y and Z is female
maternal_grandfather(X,Y) :- male(X), parent(X,Z), parent(Z,Y), female(Z).

% paternal_grandfather/2 - X is the paternal grandmother of Y if X is female AND X is the parent of Z such that Z is the parent of Y and Z is male
paternal_grandmother(X,Y) :- female(X), parent(X,Z), parent(Z,Y), male(Z).

% paternal_grandfather/2 - X is the maternal grandmother of Y if X is female AND X is the parent of Z such that Z is the parent of Y and Z is female
maternal_grandmother(X,Y) :- female(X), parent(X,Z), parent(Z,Y), female(Z).

% I stole these from the slides so I don't feel the need to comment about these
equal(X,X).
different(X,Y):- \+ equal(X,Y).
sibling(X,Y) :- parent(Z,X), parent(Z,Y), different(X,Y).

% cousin/2 - X is the cousin of Y if Z is the parent of X such that Z is the sibling of Q AND Q is the parent of Y
cousin(X,Y) :- parent(Z,X), sibling(Z,Q), parent(Q,Y).