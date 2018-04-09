gera_cor(casa(C, _, _, _, _), [C], []) :- !.
gera_cor(casa(C, _, _, _, _), Cores, Resto) :- select(C, Cores, Resto).

gera_nac(casa(_, N, _, _, _), [N], []) :- !.
gera_nac(casa(_, N, _, _, _), Nacs, Resto) :- select(N, Nacs, Resto).

gera_beb(casa(_, _, B, _, _), [B], []) :- !.
gera_beb(casa(_, _, B, _, _), Bebs, Resto) :- select(B, Bebs, Resto).

gera_cig(casa(_, _, _, C, _), [C], []) :- !.
gera_cig(casa(_, _, _, C, _), Cigs, Resto) :- select(C, Cigs, Resto).

gera_ani(casa(_, _, _, _, A), [A], []) :- !.
gera_ani(casa(_, _, _, _, A), Anis, Resto) :- select(A, Anis, Resto).

gera_casa(C, atr(Cs, Ns, Bs, Cigs, As), atr(Cs2, Ns2, Bs2, Cigs2, As2)) :-
        gera_cor(C, Cs, Cs2), gera_nac(C, Ns, Ns2),
        gera_beb(C, Bs, Bs2), gera_cig(C, Cigs, Cigs2), gera_ani(C, As, As2).

gera_casas([], _) :- !.
gera_casas([C|Cs], Atribs) :-
        gera_casa(C, Atribs, Atribs2), gera_casas(Cs, Atribs2).

gera_sol([C1, C2, C3, C4, C5]) :-
        Cores = [amarela,azul,branca,verde,vermelha],
        Nacs = [alemao,dinamarques,ingles,noruegues,sueco],
        Bebs = [agua,cafe,cerveja,cha,leite],
        Cigs = [blends,bluemaster,dunhill,pallmall,prince],
        Anis = [cachorro,cavalo,gato,passaro,peixe],
        gera_casas([C1, C2, C3, C4, C5], atr(Cores, Nacs, Bebs, Cigs, Anis)).

vizinho_esq(C1, C2, [C1,C2|_]).
vizinho_esq(C1, C2, [C3|T]) :- vizinho_esq(C1, C2, T).

vizinho_dir(C1, C2, [C2,C1|_]).
vizinho_dir(C1, C2, [C3|T]) :- vizinho_dir(C1, C2, T).

vizinho(C1, C2, S) :- vizinho_esq(C1, C2, S).
vizinho(C1, C2, S) :- vizinho_dir(C1, C2, S).

solucao(S):-
	C1=casa(_,noruegues,_,_,_),
	C3=casa(_,_,leite,_,_),
	S=[C1,C2,C3,C4,C5], !,
        vizinho_esq(casa(verde,_,_,_,_),casa(branca,_,_,_,_), S),
        vizinho(casa(_,noruegues,_,_,_), casa(azul,_,_,_,_), S),
        vizinho(casa(_,_,_,blends,_),casa(_,_,_,_,gato), S),
        vizinho(casa(_,_,_,_,cavalo),casa(_,_,_,dunhill,_), S),
        vizinho(casa(_,_,_,blends,_),casa(_,_,agua,_,_), S),
	member(casa(vermelha,ingles,_,_,_), S),
	member(casa(_,sueco,_,_,cachorro), S),
	member(casa(_,dinamarques,cha,_,_), S),
	member(casa(verde,_,cafe,_,_), S),
	member(casa(_, _, _, pallmall, passaro), S),
	member(casa(amarela,_,_,dunhill,_), S),
	member(casa(_,_,cerveja,bluemaster,_), S),
	member(casa(_,alemao,_,prince,_), S),
        gera_sol(S).
