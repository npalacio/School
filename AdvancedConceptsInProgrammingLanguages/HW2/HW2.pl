% HW2

equal(X,X).
different(X,Y):- \+ equal(X,Y).

member(X, [X|_]).
member(X, [Y|Tail]) :-
    different(X,Y),
    member(X, Tail).

% remove_duplicates([],[]).

% remove_duplicates([H | T], List) :-    
%      member(H, T),
%      remove_duplicates( T, List).

% remove_duplicates([H | T], [H|T1]) :- 
%       \+member(H, T),
%       remove_duplicates( T, T1).
      
% 1. set_union/3 - if X and Y are sets in list form, then Z is the union of X and Y
% A union is a set of elements such that each element exists in at least one set
set_union([],[],[]).

set_union([], [Y|TailY], [Y|UnionTail]) :-
    \+member(Y,UnionTail),
    set_union(TailY,UnionTail).

set_union([],[Y|TailY],UnionList) :-
    member(Y, UnionList),
    set_union([],TailY,UnionList).

set_union([X|TailX], [], [X|UnionTail]) :- 
    \+member(X,UnionTail),
    set_union(TailX,[],UnionTail).

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

% [a,b,c] [b,c,d]
% X=a,Y=b
% unionList = [a,b|tail1]

% [b,c] [c,d]
% X=b,Y=c
% tail1=[c|tail2]

% [c] [d]
% X=c,Y=d
