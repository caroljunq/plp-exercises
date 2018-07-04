
import java.util.*;

public class EstacionamentoThread extends Thread{
    private Estacionamento estacionamento;
    private int numeroOperacoes;

    public EstacionamentoThread(Estacionamento e,String nomeCarro){
        //passa para a classe Thread colocar o nomeCarro na Thread
        super(nomeCarro);
        estacionamento = e;
        //numero de operacoes que carro deve realizar
        numeroOperacoes = (int) (Math.random() * 3) + 2;
    }

    public void run(){
        //roda o número de operações de "estacionar" e "sair" para cada carro
        for(int i = 0; i < numeroOperacoes; i++){
            //estaciona carro e obtém indice preenchido
            int indexVaga = estacionamento.estacionar();
            try{
                //espera tempo antes de tirar o carro da vaga ocupada
                sleep((int)(Math.random()*1000));
            }catch(InterruptedException e){
                System.out.println("Erro no sleep do run em EstacionamentoThread");
            }
            //libera a vaga preenchida
            estacionamento.sair(indexVaga);
        }
    }
}
