import java.util.*;

public class Estacionamento {
    //vaga livre = 0, vaga ocupada = 1
    private int vagas[];

    public Estacionamento(int n_vagas){
        //inicializa número de vagas
        //por padrão todos todas as posições já começam com 0 = livres
        vagas = new int[n_vagas];
    }

    //procura vaga com status = 0 (vaga livre)
    //se não encontra vaga retorna -1
    private synchronized int procuraVaga(){
        for(int i = 0; i < vagas.length;i++){
            if(vagas[i] == 0){
                return i;
            }
        }
        return -1;
    }

    public synchronized int estacionar(){
        //enquanto não há vaga vazia, aguardar (wait)
        while(procuraVaga() == -1){
            try{
                wait();
            }catch(InterruptedException e){
                System.out.println("Erro no wait do método ESTACIONAR");
            }
        }
        //index da vaga vazia, busca SEQUENCIAL na função procuraVaga
        int indexVazio = procuraVaga();
        //altera a vaga livre para ocupada (valor 1)
        vagas[indexVazio] = 1;
        System.out.println("O carro "+ Thread.currentThread().getName() +" estaciona na vaga "+ indexVazio +".");
        notify();
        return indexVazio;
    }

    public synchronized void sair(int indexOcupada){
        //libera a vaga (livre = 0)
        vagas[indexOcupada] = 0;
        System.out.println("O carro "+ Thread.currentThread().getName() +" sai da vaga "+ indexOcupada +".");
        notify();
    }
}
