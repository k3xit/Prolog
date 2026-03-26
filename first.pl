digits(N, List) :-
    N >= 0,
    digits_helper(N, [], List).

digits_helper(0, Acc, [0]) :- Acc = [], !.
digits_helper(0, Acc, Acc) :- Acc \= [], !.
digits_helper(N, Acc, List) :-
    N > 0,
    D is N mod 10,
    N1 is N div 10,
    digits_helper(N1, [D|Acc], List).

main :-
    write('Введите целое число: '),
    read(N),
    digits(N, L),
    format('Цифры числа ~w = ~w~n', [N, L]).