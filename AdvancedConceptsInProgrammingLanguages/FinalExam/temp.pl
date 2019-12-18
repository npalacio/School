equal(X, X).
different(X,Y):- \+ equal(X,Y).
member(X, [X|_]).
member(X, [Y|Tail]) :-
different(X,Y),
member(X, Tail).
node(x).
node(y).
node(z).
node(a).
node(b).
node(c).
node(d).
node(e).
edge(x,y).
edge(y,z).
edge(z,a).
edge(a,b).
edge(e,x).
edge(x,c).
edge(c,d).
edge(d,x).
path(X, Y):-
edge(X, Y).
path(X, Y):-
edge(Z, Y),
path(X, Z).
% I got some help online with this one so I am going to talk through what it
% is doing and why it works. In my initial attempts at solving this problem I
% started out with:
% cyclic(X):-
% path(X,X).
% This made sense to me, there is a cycle from X to X if there exists a path
% from X to X in the directed graph. The issue that this ran into was that it
% would get caught in an infinite % % loop looking for a path through nodes
% that it has already actually visited because there were other cycles in the
% graph. This made me think that I was going to have to keep track of nodes
% that I visited so that I would not visit the same one twice. My first
% relation here is cyclic(X) which is from the problem definition. From here
% I will dispatch the work to another relation cycle(X,VisitedNodes) which
% keeps track of what nodes we have gone through so far so as to enforce that
% we do not visit the same node twice. If we ever find that our current node
% already exists in the list of visited nodes then we know that we have found
% a cycle. HOWEVER, there is a small bug in this implementation that I will
% point out. This relation will return true if you give it a starting node
% where there is no cycle to/from that node but that starting node has an
% edge that connects to a cycle. This bug can be demonstrated by querying
% with 'cycle(e).'. This will return true even though there is no cycle
% to/from e because e has an edge to the cycle containing x (x -> c -> d ->
% x).
cyclic(X) :-
cycle(X, []).
cycle(CurrentNode, VisitedNodes):-
member(CurrentNode, VisitedNodes).
cycle(CurrentNode, VisitedNodes):-
edge(CurrentNode, NextNode),
cycle(NextNode, [CurrentNode|VisitedNodes]).