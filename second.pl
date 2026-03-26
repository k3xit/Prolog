min_count([H|T], Count) :-
    find_min([H|T], H, Min),
    count_elem([H|T], Min, 0, Count).

find_min([], Min, Min) :- !.
find_min([H|T], CurMin, Min) :-
    H < CurMin,
    find_min(T, H, Min).
find_min([H|T], CurMin, Min) :-
    H >= CurMin,
    find_min(T, CurMin, Min).

count_elem([], _, Count, Count) :- !.
count_elem([H|T], Elem, Acc, Count) :-
    H =:= Elem,
    Acc1 is Acc + 1,
    count_elem(T, Elem, Acc1, Count).
count_elem([H|T], Elem, Acc, Count) :-
    H =\= Elem,
    count_elem(T, Elem, Acc, Count).

main :-
    write('Введите список ([3,1,4,1,5]): '),
    read(List),
    min_count(List, Count),
    format('Минимальный элемент встречается ~w раз~n', [Count]).