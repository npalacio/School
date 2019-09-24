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


% 1. set_union/3
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

% 2. set_intersection/3
set_intersection(ListX,ListY,IntersList) :-
    append(ListX,ListY,DuplicatedList),
    remove_duplicates(DuplicatedList,DeduplicatedList)
    remove_items(ListX,DeduplicatedList,ListMinusX),
    remove_items(ListY,ListMinusX,IntersList).

% remove_items/2 - List is the result of removing elements from Y that do not exist in X
remove_items(X,Y,List) :-
    