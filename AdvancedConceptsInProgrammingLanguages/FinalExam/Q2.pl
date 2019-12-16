equal(X, X).
different(X,Y):- \+ equal(X,Y).

slice(_, M, N, []):-
    equal(M, N).

slice([_|T], M, N, S):-
    M > 0,
    slice(T, M - 1, N - 1, S).

slice(_, _, N, []):-
    N < 0.

slice([H|T], M, N, [H|T1]):-
    M =< 0,
    N >= 0,
    slice(T, M - 1, N - 1, T1).
