conc([],L2,L2).
conc([H|T],L2,[H|L3]):-conc(T,L2,L3).

isFirstElement(X,L):-conc([X|_],_,L).
isLastElement(X,L) :-conc(_,[X],L).
isMember(X,L):-conc(_,[X|_],L).
isOneBeforeLast(X,L):-conc(_,[X,_|[]],L).
isThirdElement(X,L):- conc([_,_,X|_],_,L),!.

nthElement(X,[X|_],1).
nthElement(X,[_|T],N):-nthElement(X,T,N1),N is N1+1.


adjacent(X,Y,L):-conc(_,[X,Y|_],L).
subList(S,L):-conc(_,L2,L),conc(S,_,L2).




shift([H|L1],L2):-conc(L1,[H],L2).

choose(0,_,[]):-!.
choose(N,[H|T],[H|L]):- N1 is N-1,choose(N1,T,L).
choose(N,[_|T],L):-choose(N,T,L).

not(P):-P,!,fail.
not(P):-P.


tree(3,tree(4,tree(6,null,null),tree(7,null,null)),tree(5,tree(null),tree(8,null,5))).


maxValue([H],H).
maxValue([X|[Y|T]],R):-X>Y,!,maxValue([X|T],R);maxValue([Y|T],R).

minValue([H],H).
minValue([X|[Y|T]],R):- X<Y,!,minValue([X|T],R);minValue([Y|T],R).


memb(X,[X|_]):-!.
memb(X,[X|T]):-memb(X,T).


count([],0).
count([H|T],N):-count(T,N1),N is N1+1.


sum([],0).
sum([H|T],S):-sum(T,S1),S is S1+H.


evenLength(L):- count(L,N), 0 is N mod 2.
oddLength(L):- count(L,N), 1 is N mod 2.

fact(0,1).
fact(M,N):-M>0,M1 is M-1,fact(M1,N1),N is N1*M.

feb(N,R):- N==0 ,R is 0.
feb(N,R):-N> 0,feb(N-1,R1),feb(N-2,R2),R is R1+R2.

means(0,'Zero').
means(1,'One').
means(2,'Two').
means(3,'Three').
translate([],[]).
translate([H|T],[H1|T1]):-means(H,H1),translate(T,T1).


push(X,L,[X|L]).

flattern([],[]).
flattern(X,[X]).
flattern([H|T],L):-flattern(H,FH),flattern(T,FT),conc(FH,FT,L).

reverseList([],[]).
reverseList([H|T],L):- reverseList(T,L1),conc(L1,[H],L).

del(X,[X|T],T).
del(X,[Y|T1],[Y|T2]):-del(X,T1,T2).


max(X,Y,R):-X>Y, R is X,!.
max(X,Y,Y).


min(X,Y,R):-X<Y, R is X,!.
min(X,Y,Y).

p:- write("Write Number :"),read(X),write("You enterd :=>"),write(X).

pList([X]):- write("Enter List:"),read(X),write("You enterd :=>"),write(X).

stars(0):-nl.
stars(N):-write("*"),N1 is N-1,stars(N1).

bar([]).
bar([H|T]):-stars(H),bar(T).

feb(0,1):-!.
feb(1,1):-!.
feb(N,R):-N>=0,N1 is N-1,N2 is N-2,feb(N1,R1),feb(N2,R2),R is R1+R2.


febn(1).
febn(N):- N1 is N-1, N1 >=0,!,fibn(N1),write(F1," ,"),F=F1+N.


add(student(Id,Name,Dept)):-student(Id,Name,Dept),!,retract(student(Id,_,_)),assert(student(Id,Name,Dept)).

add(student(Id,Name,Dept)):-assert(student(Id,Name,Dept)).


add(parent(Name,Age,S_Id)):- parent(Name,Age,S_Id),!,retract(parent(Name,_,_)),assert(parent(Name,Age,S_Id)).

add(parent(Name,Age,S_Id)):-assert(parent(Name,Age,S_Id)).
