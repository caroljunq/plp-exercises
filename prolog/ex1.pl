get_tail([X|[]],[],X):-!.
get_tail([X|Y],[X|Z], LAST):-get_tail(Y,Z,LAST).

add_top(X,[],[X]):-!.
add_top(X,L,[X|L]).

shift_right([],[]):-!.
shift_right([X],[X]):-!.
shift_right(L1,L2):-get_tail(L1,Tail,Last),add_comeco(Last,Tail,L2).
