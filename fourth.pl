get_place(Team, [Team|_], 1) :- !.
get_place(Team, [_|Tail], Place) :-
    get_place(Team, Tail, P),
    Place is P + 1.

solve(Ranking) :-
    Teams = [spartak, cska, dynamo, rotor],
    permutation(Teams, Ranking),
    get_place(spartak, Ranking, P_S),
    get_place(cska, Ranking, P_C),
    get_place(dynamo, Ranking, P_D),
    get_place(rotor, Ranking, P_R),
    (P_S =:= 1, P_C =\= 4; P_S =\= 1, P_C =:= 4),
    (P_S >= 3, P_C =\= 2; P_S < 3, P_C =:= 2),
    (P_D =:= 1, P_C > 3; P_D =\= 1, P_C =< 3),
    (P_D =:= 2, P_R =\= 4; P_D =\= 2, P_R =:= 4).

print_team(spartak, 'Спартак').
print_team(cska, 'ЦСКА').
print_team(dynamo, 'Динамо').
print_team(rotor, 'Ротор').

print_ranking([Team]) :-
    print_team(Team, Name),
    write(Name).
print_ranking([Team|Rest]) :-
    print_team(Team, Name),
    format('~w, ', [Name]),
    print_ranking(Rest).

main :-
    solve(Ranking),
    write('Распределение мест (с 1 по 4): '),
    print_ranking(Ranking),
    nl.