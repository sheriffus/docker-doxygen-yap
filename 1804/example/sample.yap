% -*- mode: prolog -*-

/*************************************************************************
*
*   Docker for YAProlog - DYP
*
*   DYP was developed at NCCUP - Universidade do Porto
*
*   Copyright
*   C. Amaral, A. M. Florido, V.S.Costa, P. B. Vasconcelos
*   and Universidade do Porto 2012-2019
*
**************************************************************************
*
* File:     sample.yap
* Last rev: 2019/03/18
* mods:
* comments: A sample Prolog file for showing how YAP docker container works
*
*************************************************************************/

% An example using lists:

% length of a list
size([],0).
size([_H|T],s(N)) :- size(T,N).

% | ?- size([1,2,3,4],N).
% N = s(s(s(s(0))))
% yes

% | ?- size([bill,ted,ming,pascal,nat,ron],N).
% N = s(s(s(s(s(s(0))))))
% yes

% | ?- size([a, [b, c, d], e, [f | g], h], N).
% N = s(s(s(s(s(0)))))
% yes

% summing elements of a list of numbers
sumlist([],0).
sumlist([H|T],N) :- sumlist(T,N1), N is N1+H.

% | ?- sumlist([1,2,3,4],N).
% N = 10
% yes

% list membership
member(X,[X|_]).
member(X,[_|T]) :- member(X,T).

% | ?- member(a, [a, [b, c, d], e, [f | g], h]).
% yes
% | ?- member(b, [a, [b, c, d], e, [f | g], h]).
% no / false
% | ?- member([f | g], [a, [b, c, d], e, [f | g], h]).
% yes

% reversing a list
reverse(L, LRev) :-
          reverse_aux(L, [], LRev).

reverse_aux([], Rev, Rev).
reverse_aux([H|T], RevAcc, Rev) :-
          reverse_aux(T, [H|RevAcc], Rev).

% | ?- reverse([a,b,c,d],X).
% X = [d,c,b,a];     <- note semicolon (more solns?)
% no
% | ?- reverse([a,b,c,d],[d,b,c,a]).
% no
% | ?- reverse([a,b,c,d],[d,c,b,a]).
% yes
:- initialization(passing).

passing :- passing1, nl, passing2, nl, passing3, nl, passing4, nl,
           passing5, nl, passing6, nl, passing7, nl, passing8, nl,
           passing9, nl, nl.
passing1 :- size([1,2,3,4],N), writeln(N), writeln(test1_ok) ; writeln(test1_failed).
passing2 :- size([bill,ted,ming,pascal,nat,ron],N), writeln(N), writeln(test2_ok) ; writeln(test2_failed).
passing3 :- size([a, [b, c, d], e, [f | g], h], N), writeln(N), writeln(test3_ok) ; writeln(test3_failed).
passing4 :- sumlist([1,2,3,4],N), writeln(N), writeln(test4_ok) ; writeln(test4_failed).
passing5 :- member(a, [a, [b, c, d], e, [f | g], h]), writeln(test5_ok) ; writeln(test5_failed).
passing6 :- member([f | g], [a, [b, c, d], e, [f | g], h]), writeln(test6_ok) ; writeln(test6_failed).
passing7 :- reverse([a,b,c,d],X), writeln(X), writeln(test7_ok) ; writeln(test7_failed).
passing8 :- reverse([a,b,c,d],[d,c,b,a]), writeln(test8_ok) ; writeln(test8_failed).
passing9 :- writeln('Passing tests done. ').

%:- initialization(failing).

failing :- failing1, nl, failing2, nl,
           failing3, nl, nl.
failing1 :- member(b, [a, [b, c, d], e, [f | g], h]), writeln(test1_failed) ; writeln(test1_ok).
failing2 :- reverse([a,b,c,d],[d,b,c,a]), writeln(test2_failed) ; writeln(test2_ok).
failing3 :- writeln('Passing tests done. ').
