sym_diff(A, B, Result) :-
    filter_not_in(A, B, OnlyA),
    filter_not_in(B, A, OnlyB),
    append(OnlyA, OnlyB, Result).

filter_not_in([], _, []) :- !.
filter_not_in([H|T], Set, [H|Rest]) :-
    \+ member(H, Set),
    filter_not_in(T, Set, Rest).
filter_not_in([H|T], Set, Rest) :-
    member(H, Set),
    filter_not_in(T, Set, Rest).

main :-
    write('Введите первое множество (список без повторений): '),
    read(SetA),
    write('Введите второе множество (список без повторений): '),
    read(SetB),
    sym_diff(SetA, SetB, Result),
    format('Симметричная разность: ~w~n', [Result]).