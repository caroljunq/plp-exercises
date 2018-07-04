## Trabalho 3 - Programação Concorrente
### Disciplina
Paradigmas de Linguagem de Programação - 2018-1
### Grupo
* Carolina Junqueira
* Julio Brito

## Documentação
O trabalho é composto por três classes: Estacionamento, EstacionamentoThread e EstacionamentoFuncionando.

Informações adicionais podem ser encontradas em comentários nos códigos a seguir.

## Descrição de classes
### Estacionamento
Esta classe é responsável pelo controle das operações de estacionar e liberar o carro da vaga.

Para representar as vagas é utilizado um array de inteiros. Se a posição "i" possui 0, significa que a vaga i está livre. Se o índice i possui o inteiro 1, a vaga i está ocupada.

Quando instanciada, o construtor da classe Estacionamento recebe o número de vagas desejadas no estacionamento e instancia o array de inteiros com esse número.

#### Métodos
* **procuraVaga:** sequencialmente, procura uma vaga livre (vaga = 0) no array de vagas, e retorna o índice da primeira encontrada;

* **estacionar:** é um método synchronized que busca/aguarda (wait) uma vaga vazia para estacionar o carro. Quando um vaga livre é encontrada, muda o valor no array para 1, e retorna o índice da vaga encontrada;

* **sair:** recebe um índice de vaga e muda o valor para 0 (ocupada) no array.

#### Código
```
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
```

### EstacionamentoThread
Esta classe é uma Thread que representa um carro fazendo as chamadas das operações de "estacionar" e "sair" da classe Estacionamento.

O construtor recebe uma instância da classe Estacionamento e uma string com o nome do carro. Posteriormente, EstacionamentoThread
delega a superclasse Thread para nomear a thread com a string recebida como parâmetro. O número de operações que um carro deve realizar também é gerado aleatoriamente.

#### Métodos
* **run:** este método é executado quando uma thread é iniciada. Nesse caso, há um laço que executa as operações de estacionar/sair o número de vezes definido pelo campo "numeroOperacoes". Primeiro, o carro chama o método "estacionar" da classe Estacionamento, depois "dorme" a thread por milisegundos determinados aleatoriamente. Por fim, o método "sair" do estacionamento é chamado.

#### Código
```
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
```

### EstacionamentoFuncionando
Esta classe possui o método main que instancia 10 threads carros (EstacionamentoThread) e instancia um objeto Estacionamento com 6 vagas. No final, inicia todas as threads de carros criadas (start).

#### Código
```
import java.util.*;

public class EstacionamentoFuncionando {

    public static void main(String[] args) {
        //estacionamento com 6 vagas
        Estacionamento estacionamento = new Estacionamento(6);
        //cria um vector de EstacionamentoThread
        Vector<EstacionamentoThread> carros = new Vector<EstacionamentoThread>();
        int numCarros = 10;
        //instancia os 10 carros e adiciona em vector
        for(int i = 0; i < numCarros; i++){
            String nomeCarro = "carro" + i;
            carros.add(new EstacionamentoThread(estacionamento,nomeCarro));
        }

        //executa cada uma das threads de carros
        for(int i = 0; i < carros.size(); i++){
            carros.get(i).start();
        }
    }

}
```

## Como executar
* **Opção 1**: importar arquivos para IDEs, como Netbeans;
* **Opção 2**: execução através do terminal com os comandos a seguir.
*
```
$- javac EstacionamentoFuncionando.java
$- java EstacionamentoFuncionando
```

## Exemplos de execução

### Execução 1
```
O carro carro1 estaciona na vaga 0.
O carro carro0 estaciona na vaga 1.
O carro carro2 estaciona na vaga 2.
O carro carro3 estaciona na vaga 3.
O carro carro4 estaciona na vaga 4.
O carro carro5 estaciona na vaga 5.
O carro carro1 sai da vaga 0.
O carro carro6 estaciona na vaga 0.
O carro carro5 sai da vaga 5.
O carro carro5 estaciona na vaga 5.
O carro carro0 sai da vaga 1.
O carro carro0 estaciona na vaga 1.
O carro carro0 sai da vaga 1.
O carro carro7 estaciona na vaga 1.
O carro carro6 sai da vaga 0.
O carro carro6 estaciona na vaga 0.
O carro carro4 sai da vaga 4.
O carro carro4 estaciona na vaga 4.
O carro carro6 sai da vaga 0.
O carro carro6 estaciona na vaga 0.
O carro carro5 sai da vaga 5.
O carro carro5 estaciona na vaga 5.
O carro carro5 sai da vaga 5.
O carro carro8 estaciona na vaga 5.
O carro carro3 sai da vaga 3.
O carro carro3 estaciona na vaga 3.
O carro carro2 sai da vaga 2.
O carro carro2 estaciona na vaga 2.
O carro carro4 sai da vaga 4.
O carro carro4 estaciona na vaga 4.
O carro carro7 sai da vaga 1.
O carro carro7 estaciona na vaga 1.
O carro carro6 sai da vaga 0.
O carro carro6 estaciona na vaga 0.
O carro carro3 sai da vaga 3.
O carro carro3 estaciona na vaga 3.
O carro carro8 sai da vaga 5.
O carro carro8 estaciona na vaga 5.
O carro carro6 sai da vaga 0.
O carro carro9 estaciona na vaga 0.
O carro carro3 sai da vaga 3.
O carro carro1 estaciona na vaga 3.
O carro carro2 sai da vaga 2.
O carro carro2 estaciona na vaga 2.
O carro carro8 sai da vaga 5.
O carro carro8 estaciona na vaga 5.
O carro carro7 sai da vaga 1.
O carro carro7 estaciona na vaga 1.
O carro carro9 sai da vaga 0.
O carro carro9 estaciona na vaga 0.
O carro carro4 sai da vaga 4.
O carro carro2 sai da vaga 2.
O carro carro7 sai da vaga 1.
O carro carro1 sai da vaga 3.
O carro carro1 estaciona na vaga 1.
O carro carro8 sai da vaga 5.
O carro carro8 estaciona na vaga 2.
O carro carro1 sai da vaga 1.
O carro carro1 estaciona na vaga 1.
O carro carro9 sai da vaga 0.
O carro carro9 estaciona na vaga 0.
O carro carro9 sai da vaga 0.
O carro carro8 sai da vaga 2.
O carro carro1 sai da vaga 1.
```

### Execução 2
```
O carro carro0 estaciona na vaga 0.
O carro carro4 estaciona na vaga 1.
O carro carro3 estaciona na vaga 2.
O carro carro2 estaciona na vaga 3.
O carro carro1 estaciona na vaga 4.
O carro carro7 estaciona na vaga 5.
O carro carro0 sai da vaga 0.
O carro carro0 estaciona na vaga 0.
O carro carro4 sai da vaga 1.
O carro carro4 estaciona na vaga 1.
O carro carro3 sai da vaga 2.
O carro carro3 estaciona na vaga 2.
O carro carro7 sai da vaga 5.
O carro carro7 estaciona na vaga 5.
O carro carro1 sai da vaga 4.
O carro carro1 estaciona na vaga 4.
O carro carro2 sai da vaga 3.
O carro carro2 estaciona na vaga 3.
O carro carro4 sai da vaga 1.
O carro carro4 estaciona na vaga 1.
O carro carro3 sai da vaga 2.
O carro carro8 estaciona na vaga 2.
O carro carro0 sai da vaga 0.
O carro carro0 estaciona na vaga 0.
O carro carro7 sai da vaga 5.
O carro carro9 estaciona na vaga 5.
O carro carro8 sai da vaga 2.
O carro carro8 estaciona na vaga 2.
O carro carro9 sai da vaga 5.
O carro carro9 estaciona na vaga 5.
O carro carro1 sai da vaga 4.
O carro carro6 estaciona na vaga 4.
O carro carro6 sai da vaga 4.
O carro carro6 estaciona na vaga 4.
O carro carro2 sai da vaga 3.
O carro carro5 estaciona na vaga 3.
O carro carro0 sai da vaga 0.
O carro carro4 sai da vaga 1.
O carro carro4 estaciona na vaga 0.
O carro carro9 sai da vaga 5.
O carro carro9 estaciona na vaga 1.
O carro carro5 sai da vaga 3.
O carro carro5 estaciona na vaga 3.
O carro carro8 sai da vaga 2.
O carro carro8 estaciona na vaga 2.
O carro carro5 sai da vaga 3.
O carro carro4 sai da vaga 0.
O carro carro9 sai da vaga 1.
O carro carro9 estaciona na vaga 0.
O carro carro6 sai da vaga 4.
O carro carro6 estaciona na vaga 1.
O carro carro8 sai da vaga 2.
O carro carro8 estaciona na vaga 2.
O carro carro6 sai da vaga 1.
O carro carro6 estaciona na vaga 1.
O carro carro6 sai da vaga 1.
O carro carro9 sai da vaga 0.
O carro carro8 sai da vaga 2.
```

### Execução 3
```
O carro carro0 estaciona na vaga 0.
O carro carro8 estaciona na vaga 1.
O carro carro7 estaciona na vaga 2.
O carro carro6 estaciona na vaga 3.
O carro carro5 estaciona na vaga 4.
O carro carro4 estaciona na vaga 5.
O carro carro0 sai da vaga 0.
O carro carro0 estaciona na vaga 0.
O carro carro6 sai da vaga 3.
O carro carro6 estaciona na vaga 3.
O carro carro0 sai da vaga 0.
O carro carro1 estaciona na vaga 0.
O carro carro5 sai da vaga 4.
O carro carro5 estaciona na vaga 4.
O carro carro1 sai da vaga 0.
O carro carro1 estaciona na vaga 0.
O carro carro7 sai da vaga 2.
O carro carro7 estaciona na vaga 2.
O carro carro1 sai da vaga 0.
O carro carro1 estaciona na vaga 0.
O carro carro4 sai da vaga 5.
O carro carro4 estaciona na vaga 5.
O carro carro8 sai da vaga 1.
O carro carro8 estaciona na vaga 1.
O carro carro6 sai da vaga 3.
O carro carro6 estaciona na vaga 3.
O carro carro4 sai da vaga 5.
O carro carro3 estaciona na vaga 5.
O carro carro5 sai da vaga 4.
O carro carro5 estaciona na vaga 4.
O carro carro1 sai da vaga 0.
O carro carro9 estaciona na vaga 0.
O carro carro7 sai da vaga 2.
O carro carro7 estaciona na vaga 2.
O carro carro5 sai da vaga 4.
O carro carro2 estaciona na vaga 4.
O carro carro8 sai da vaga 1.
O carro carro8 estaciona na vaga 1.
O carro carro2 sai da vaga 4.
O carro carro2 estaciona na vaga 4.
O carro carro6 sai da vaga 3.
O carro carro6 estaciona na vaga 3.
O carro carro3 sai da vaga 5.
O carro carro3 estaciona na vaga 5.
O carro carro2 sai da vaga 4.
O carro carro2 estaciona na vaga 4.
O carro carro7 sai da vaga 2.
O carro carro7 estaciona na vaga 2.
O carro carro7 sai da vaga 2.
O carro carro8 sai da vaga 1.
O carro carro8 estaciona na vaga 1.
O carro carro9 sai da vaga 0.
O carro carro9 estaciona na vaga 0.
O carro carro2 sai da vaga 4.
O carro carro2 estaciona na vaga 2.
O carro carro9 sai da vaga 0.
O carro carro3 sai da vaga 5.
O carro carro3 estaciona na vaga 0.
O carro carro6 sai da vaga 3.
O carro carro2 sai da vaga 2.
O carro carro8 sai da vaga 1.
O carro carro3 sai da vaga 0.
O carro carro3 estaciona na vaga 0.
O carro carro3 sai da vaga 0.
```
