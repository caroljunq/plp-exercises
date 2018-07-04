// ex1
Competição é o método de sincronização onde uma thread A requisita um recurso que está sendo usado pela thread B, então
A fica em esperaaté que B termine de usar este recurso.

Cooperação é quando uma thread A espera que B termine alguma tarefa em específico para continuar.

// ex2 --> folha

// ex3--> descrever P wait e V release

Um semáforo pode ser usado para sincronização de tarefas por competição ou cooperação.
Semáforo é um estrutura de dados composta por um inteiro ou uma fila que guarda informações sobre os estados
de execução de tarefas.
Numa sincronização por cooperação, um campo inteiro é usado, já numa sincronização por cooperação, um campo binário é utilizado.
Numa sincronização por cooperação:
- P recebe um semáforo que é testado. Se o contador é maior que 0, a tarefa pode ser executada e o contador é decrementado. Senão,
a tarefa é colocada na fila do semáforo.
-V verifica se processo pode utilizar recurso que está sendo contado.Testa a fila do semáforo. Se ela for vazia,
incrementa contador indicando que há recurso disponível. Senão, move uma das tarefas da fila para a fila de tarefas prontas.

Numa sincronização por competiçãp:
- P verifica semaforo para ver se ele pode acessar ou não a região critica. Se já existir um processo na região crítica, ele é colocado
na fila. Senão, pode executar. A operação V sobre um semáforo  sinaliza o semaforo que o processo não está mais na região crítica e retira outro
processo da fila., colocando-o em execução.

// ex4
// inicializacao

P(S)
 S.valor -= 1;
 Se (S.valor < 0)
 // bloqueia o processo e insere em S.fila
V(S)
 S.valor += 1;
 Se (S.valor <= 0)
 //retira algum processo de S.fila e o coloca em execução


 fim = 0;
 ini = 0;
 n = 0;
 semáforo S;
 S.valor = 1;
 // codigo do produtor
 for (i=0; i<1000; i++) {
   while (n == capacidade);
   buf[fim] = produzir(i);
   fim = (fim + 1) % capacidade;
   P(S)
   n++;
   V(S)
 }
 // codigo do consumidor
 for (i=0; i<1000; i++) {
   while (n == 0) ;
   consumir(buf[ini]);
   ini = (ini + 1) % capacidade;
   P(S)
   n--;
   V(S)
 }


 // ex5
  fim = 0;
 ini = 0;
 n = 0;
 semáforo Cheio,Vazio;
 Cheio.valor = 1;
 Vazio.valor = 1;
 // codigo do produtor
 for (i=0; i<1000; i++) {
   while (n == capacidade) P(Cheio);
   buf[fim] = produzir(i);
   fim = (fim + 1) % capacidade;
   n++;
   V(Vazio)
 }
 // codigo do consumidor
 for (i=0; i<1000; i++) {
   while (n == 0) P(Vazio);
   consumir(buf[ini]);
   ini = (ini + 1) % capacidade;
   n--;
   V(Cheio)
 }

 // ex7
 class Semaforo{
    int valor = 1;

    public synchronized void P() throws Exception{
        valor -= 1;
        if (valor < 0)
            wait();

    }

    public synchronized void V(){
        valor += 1;
        if (valor <= 0)
         notify();
    }

}

// ex8
class Banco {
 double conta[] = new double[5];
 void set_conta(int i, double d) {
conta[i] = d;
 }
 public synchronized void transferencia(int origem, int destino, double valor) {
while (conta[origem] < valor) {
 try {
 wait ();
 } catch (InteruptedException e) {
 }
}
conta[origem] -= valor;
conta[destino] += valor;
notify();
 }
}

// ex9
class Corredor extends Thread{
    private int points = 0;
    Corredor(String nome){
        super(nome);
    }

    public void run(){
        double taxa_pulo;
        char v[] = new char[20];
        for(int i = 0; i < 20; i++){
            try {
                sleep((int) (Math.random( ) * 500));
            }catch (Exception e) {};

            System.out.print(this.getName());
            if((i+1) % 4 == 0 && (i+1)!= 20){
                taxa_pulo = (Math.random() * 21)  + 80;
                if(taxa_pulo >= 90){
                    v[i] = '1';
                }
                else{
                    points += 1;
                    v[i] = '0';
                }
            }else{
               v[i] = '-';
            }

            for(int j = 0; j < i; j++){
                System.out.print(v[j]);
            }
            System.out.println(">");
        }
        System.out.println(getName() + " ganhou a prova e perdeu "+ points + " pontos.");
    }

}

// ex10
class Conta{
    private double saldo;

    Conta(double s){
        saldo = s;
    }

    public synchronized void saque(double valor){
        while (saldo < valor) {
            try {
                wait( ) ;
            }catch (InterruptedException e) {}
        }
        saldo = saldo - valor;
        notify();
    }

    public synchronized void consulta(){
        notify();
        System.out.println("Seu saldo eh " + saldo);
    }

}
// ex11 e ex12
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaapplication1;

import java.util.*;

class Conta{
    private double saldo;

    public void setSaldo(double s){
        saldo = s;
    }

    public double getSaldo(){
        return saldo;
    }


}


class Banco{
    Conta contas[];

    Banco(int n, double saldo_ini){
        contas = new Conta[n];
        for(int i = 0; i < contas.length; i++){
            contas[i] = new Conta();
            contas[i].setSaldo(saldo_ini);
        }

    }

    public synchronized void saque(int id, double valor){
        while (contas[id].getSaldo() < valor) {
            try {
                wait( ) ;
            }catch (InterruptedException e) {}
        }
        double novo = contas[id].getSaldo() - valor;
        contas[id].setSaldo(novo);
        notify();
    }

    public synchronized double consulta(int id){
        System.out.println(contas.toString());
        double s = contas[id].getSaldo();
        notify();
        return s;
    }

    public synchronized void deposito(int id, double valor){
        double s = contas[id].getSaldo() + valor;
        contas[id].setSaldo(s);
        notify();
    }

}


class UFSCAR extends Thread{
    Banco b;
    private int n;
    private double valor;

    UFSCAR(Banco b, int n, double valor){
        this.b = b;
        this.n = n;
        this.valor = valor;

    }
    public void run() {
        for (int i = 0; i  < n; i ++) {
            try {
                b.deposito(i, valor);
                sleep((int) (500 * Math.random()));
            } catch (InterruptedException e) {
            }
        }
    }

}

class CorrentistaThread extends Thread {
    private Banco bb;
    private int i_conta;
    private double valor;
    CorrentistaThread(Banco bb, int i_conta, double valor) {
        this.bb = bb;
        this.i_conta= i_conta;
        this.valor = valor;
    }
    public void run () {
        for (int i = 0; i < 4; i++) {
            try {
                double d_ou_s = Math.random();
                if(d_ou_s < 0.5){
                    System.out.println("Maoee");
                    bb.saque(i_conta,valor);
                }
                else{
                    System.out.println(bb.consulta(i_conta));
                }
                sleep((int) (500 * Math.random()));
            } catch (InterruptedException e) {}
        }
    }
}

public class JavaApplication1 {

    //fingir que é a classe Banco
 public static void main (String argv [ ]) throws Exception{
     Banco b = new Banco(5,0);
     UFSCAR uf = new UFSCAR(b,5,400);
     CorrentistaThread c = new CorrentistaThread(b, 2, 20);
     CorrentistaThread c2 = new CorrentistaThread(b, 1, 20);
     CorrentistaThread c3 = new CorrentistaThread(b, 3, 20);
     uf.start();
     uf.join();
     c.start();
     c.join();
     c2.start();
     c2.join();
     c3.start();
     c3.join();
 }

}
