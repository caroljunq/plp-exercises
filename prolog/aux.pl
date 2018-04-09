/* p(Nome, Sobrenome, Brincadeira, Vitima) */

gera(p(N, S, B, V)) :-
        member(N, [ana, ester, pablo, rodolfo]),
        member(S, [fontes, levis, matoso, salgado]),
        member(B, [almofada, aranha, foto, mosca]),
        member(V, [irmao, mae, pai, tia]).

dif(p(N1, S1, B1, V1), p(N2, S2, B2, V2)) :-
        N1 \= N2, S1 \= S2, B1 \= B2, V1 \= V2.

todas_dif(P1, P2, P3, P4) :-
        dif(P1, P2), dif(P1, P3), dif(P1, P4),
        dif(P2, P3), dif(P2, P4), dif(P3, P4).

solucao(S) :-
        S = [P1, P2, P3, P4],
        gera(P1), gera(P2), gera(P3), gera(P4),
        todas_dif(P1, P2, P3, P4),
        member(p(ana, _, aranha, _), S),
        member(p(N, salgado, _, irmao), S), N \= ana,
        member(p(_, matoso, almofada, _), S),
        member(p(rodolfo, _, B, tia), S), B \= almofada,
        member(p(_, levis, mosca, _), S),
        member(p(ester, _, _, pai), S).

gera_ef(P1, P2, P3, P4) :-
        P1 = p(ana, _, _, _),
        P2 = p(ester, _, _, _),
        P3 = p(pablo, _, _, _),
        P4 = p(rodolfo, _, _, _),
        gera(P1), gera(P2), gera(P3), gera(P4),
        todas_dif(P1, P2, P3, P4).

solucao2(S) :-
        S = [P1, P2, P3, P4],
        gera_ef(P1, P2, P3, P4),
        member(p(ana, _, aranha, _), S),
        member(p(N, salgado, _, irmao), S), N \= ana,
        member(p(_, matoso, almofada, _), S),
        member(p(rodolfo, _, B, tia), S), B \= almofada,
        member(p(_, levis, mosca, _), S),
        member(p(ester, _, _, pai), S),
        !.
