% HW2

equal(X,X).
different(X,Y):- \+ equal(X,Y).

member(X, [X|_]).
member(X, [Y|Tail]) :-
    different(X,Y),
    member(X, Tail).

% I stole remove_duplicates from a stack overflow question (https://stackoverflow.com/questions/39435709/how-to-remove-duplicates-from-a-list-in-swi-prolog)
% but I will annotate what this is doing
% remove_duplicates/2
% 'The list after removing duplicates from an empty list is an empty list'
remove_duplicates([],[]).

% 'List is the list after removing duplicates from a list with head H and tail T such that H is a member of T and List is 
% the result of removing duplicates from the list T'
remove_duplicates([H | T], List) :-    
     member(H, T),
     remove_duplicates( T, List).

% 'The list with head H and tail T1 is the result of removing duplicates from the list with head H and tail T such that H is
% not a member of list T and T1 is the list after removing duplicates from list T'
remove_duplicates([H | T], [H|T1]) :- 
      \+member(H, T),
      remove_duplicates( T, T1).


% 1. set_union/3 - if X and Y are sets in list form, then Z is the union of X and Y
% A union is a set of elements such that each element exists in at least one set
set_union([],[],[]).
set_union([X],[],[X]).
set_union([],[Y],[Y]).
set_union([X],[Y],[X,Y]) :-
    different(X,Y).

% 'UnionList is the list that represents the set union of ListX and ListY such that DuplicatedUnionList is the result of appending
% ListX and ListY and Union list is the result of removing duplicates from DuplicatedUnionList'
set_union(ListX,ListY,UnionList) :-
    append(ListX,ListY,DuplicatedUnionList),
    remove_duplicates(DuplicatedUnionList,UnionList).


