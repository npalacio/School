equal(X, X).
different(X,Y):- \+ equal(X,Y).

node(x).
node(y).
node(z).
node(a).
node(b).

edge(x,y).
edge(y,z).
edge(z,a).
edge(a,b).

edge(x,c).
edge(c,x).

path(X, Y):-
    edge(X, Y).

path(X, Y):-
    edge(Z, Y),
    path(X, Z).

cyclic(X):-
    path(X, X).