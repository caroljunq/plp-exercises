rotate(right, L, [T|H]) :- append(H, [T], L).
rotate(left, [H|T], L) :- append(T, [H], L).
nshift(0, L, L) :- !.
nshift(N, L1, L2) :-
  N < 0, rotate(right, L1, L), N1 is N+1, nshift(N1, L, L2).
nshift(N, L1, L2) :-
  N > 0, rotate(left, L1, L), N1 is N-1, nshift(N1, L, L2).
