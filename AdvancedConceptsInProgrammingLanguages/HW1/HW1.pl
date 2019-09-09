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
% definition. The third one defines its base case as someone is their own ancestor. The difference between the first two examples
% and the third is best illustrated by asking prolog if bill or mary or anyone is their own ancestor (ancestor(bill,bill)). The
% first two will say this is false. The third will say it is true.

% at what point does prolog start plugging variables in and how does it know what to use?
% is it accurate to call these recursive definitions with base cases?

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
%parent(patty, jane).
%parent(rich, jane).
parent(susan, rich).
parent(sam, rich).