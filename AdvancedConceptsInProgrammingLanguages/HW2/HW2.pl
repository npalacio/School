% HW2

equal(X,X).
different(X,Y):- \+ equal(X,Y).

member(X, [X,_]).
member(X, [Y|Tail]) :-
    different(X,Y),
    member(X, Tail).

deduplicate([Head|Tail], DeduplicatedList) :-
    member(Head, Tail),
    deduplicate(Tail, DeduplicatedList).

deduplicate([Head|Tail], [Head|T]) :-
    \+member(Head, Tail),
    deduplicate(Tail, T).

% 1. set_union/3 - if X and Y are sets in list form, then Z is the union of X and Y
% A union is a set of elements such that each element exists in at least one set
set_union([],[],[]).

set_union([], [Y|TailY], [Y|UnionTail]) :-
    \+member(Y,UnionTail)
    set_union(TailY,UnionTail).

set_union([],[Y|TailY],UnionList) :-
    member(Y, UnionList),
    set_union([],TailY,UnionList).

set_union([X|TailX], [], [X|UnionTail] :-
    \+member(X,UnionTail)
    set_union(TailX,UnionTail).

set_union([X|TailX],[],UnionList) :-
    member(X, UnionList),
    set_union(TailX,[],UnionList).

set_union([X|TailX], [X|TailY], [X|UnionTail]) :-
    \+member(X,UnionTail),
    set_union(TailX, TailY, UnionTail).

set_union([X|TailX], [Y|TailY], [X,Y|UnionTail]) :-
    different(X,Y),
    \+member(X, UnionTail),
    \+member(Y, UnionTail),
    set_union(TailX, TailY, UnionTail).

set_union([X|TailX], [Y|TailY], [X|UnionTail]) :-
    different(X,Y),
    \+member(X, UnionTail),
    member(Y, UnionTail),
    set_union(TailX, TailY, UnionTail).

set_union([X|TailX], [Y|TailY], [Y|UnionTail]) :-
    different(X,Y),
    member(X, UnionTail),
    \+member(Y, UnionTail),
    set_union(TailX, TailY, UnionTail).
