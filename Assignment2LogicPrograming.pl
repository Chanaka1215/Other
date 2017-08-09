% To Split a given list
split(0,L,[],L).
split(N,[H|L],[H|L1],L2):- N1 is N-1, split(N1,L,L1,L2).

