/* Group members: Tobias Bird, Harper Swenson, Victor Campa, Gregory Oertli */

/* Exercise 1 */

redefine_system_predicate(when).

when(275,10).
when(261,12).
when(381,11).
when(398,12).
when(399,12).

where(275,owen102).
where(261,dear118).
where(381,cov216).
where(398,dear118).
where(399,cov216).

enroll(mary,275).
enroll(john,275).
enroll(mary,261).
enroll(john,381).
enroll(jim,399).

/* (a) */
schedule(A,B,C) :- enroll(A,Z), where(Z,B), when(Z,C).

/* (b) */
usage(A,B) :- where(Z,A), when(Z,B).

/* (c) */
conflict(A,B) :- where(A,Z), where(B,Z), when(A,X), when(B,X), A\=B.

/* (d) */
meet(X,Y) :- enroll(X,A), enroll(Y,A), X\=Y.
meet(X,Y) :- enroll(X,A), enroll(Y,B), when(A,C), when(B,D), where(A,Z), where(B,Z), D is C+1, X\=Y.
meet(X,Y) :- enroll(X,A), enroll(Y,B), when(A,C), when(B,D), where(A,Z), where(B,Z), C is D+1.
/* Exercise 2 */

/* (a) */
rdups([],[]).
rdups([X|Y],Z) :- member(X,Y), rdups(Y,Z).
rdups([X|Y],[X|Z]) :- (\+(member(X,Y))), rdups(Y,Z).
/* (b) */
flat([], []).
flat([L|M], F) :- flat(L, Z1), flat(M, Z2), append(Z1, Z2, F).
flat([L|Z1], [L|Z2]) :- L \= [_], L \= [_], flat(Z1,Z2).
/* (c) */
