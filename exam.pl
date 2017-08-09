member(X,[H|T]).
member(X,[H|T]) :- member(X,T).

max(X,Y,Z):-X>=Y,X=Z,!.
max(X,Y,Z):-Y>=X,Z=Y.

