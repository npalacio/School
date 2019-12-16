equal(X, X).
different(X,Y):- \+ equal(X,Y).

slice(_, M, N, []):-
    equal(M, N).

slice([H|T], M, N, [H|T1])
    equal(M, 0),
    slice(T, M - 1, N - 1, T1).

slice([_|T], M, N, S):-
    different(M, 0),
    slice(T, M - 1, N - 1, S).