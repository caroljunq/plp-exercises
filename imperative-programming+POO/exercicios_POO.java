// ex1
public class TransformStrings {
    String S1 = "";
    String S2 = "";
    String S3 = "";
    int count1 = 0;
    int count2 = 0;
    int count3 = 0;

    public void novaString(String s){
        if(s.charAt(0) == 'a'){
            S1 =  S1 + s;
            count1++;
        }

        if(s.charAt(0) == 'b'){
            S2 =  S2 + s;
            count2++;
        }

        if(s.charAt(0) == 'c'){
            S3 =  S3 + s;
            count3++;
        }
    }
}


//ex2
public class ContaLetras {

    public int conta(String s, char l){
        int count = 0;
        for(int i = 0; i < s.length();i++){
            if(s.charAt(i) == l){
                count++;
            }

        }

       return count;
    }
}

//ex3
public class MudaLetra {

    public String elimina(String s, char l){
        String res = "";
        for(int i = 0; i < s.length(); i++){
            if(s.charAt(i) != l){
                res += s.charAt(i);
            }
        }

        return res;
    }
}

// ex4
public class Nome {
    String proprio;
    String meio;
    String familia;

    Nome(String p, String m, String f){
        proprio = p;

        meio = m;
        familia = f;
    }

    public String rubrica(){
        String s = "";
        s += Character.toString(proprio.charAt(0)) + Character.toString(meio.charAt(0)) + Character.toString(familia.charAt(0));
        return s.toLowerCase();
    }

    public String assinatura(){
        String s = "";
        s += Character.toUpperCase(proprio.charAt(0))+"."+Character.toUpperCase(meio.charAt(0))+"."+familia;
        return s;
    }
}

// ex5
public class ListaDupla<E> extends LinkedList<E>{


    public E topo(){
        return getFirst();
    }

    public E ultimo(){
        return getLast();
    }

    public E sucessor(E el){
        int index = indexOf(el);

        if(index == size() - 1 || index == -1){
            System.out.println("Nao tem sucessor");
            return el;
        }
        return get(index+1);

    }

    public E antecessor(E el){
        int index = indexOf(el);
        if(index == 0 || index == -1){
            System.out.println("Nao tem antecessor");
            return el;
        }
        return get(index-1);

    }
}

// ex6
public class Pilhas {
    LinkedList<Integer> p1 = new LinkedList();
    LinkedList<Integer> p2 = new LinkedList();

    void separa(LinkedList l){
        for(int i = 0; i< l.size();i++){
            int el = (int) l.get(i);
            if(el < 0){
                p1.add(0,el);
            }else if(el > 0){
                p2.add(0,el);
            }else{
                break;
            }
        }
        System.out.println("Primeira: "+p1.toString());
        System.out.println("Segunda: "+p2.toString());
    }
}

// ex7
public class Ordena{
    public ArrayList<String> listaNomes = new ArrayList();

    public boolean adiciona(String el){
        int index = 0;


        while(listaNomes.size()> 0 && el.compareTo(listaNomes.get(index)) > 0 && index < listaNomes.size()){
            index++;
        }

        listaNomes.add(index,el);
        System.out.println(listaNomes);
        return true;
    }
}


// ex8
public class Ordena2 {

    ArrayList<Integer> listaNum = new ArrayList();


    public boolean ordena(int el){
        int index = 0;

        while(listaNum.size() > 0 && index < listaNum.size() && el > listaNum.get(index)){
            index++;
        }

        listaNum.add(index,el);
        return true;
    }

    public boolean sub(int e1, int e2){
        for(int i = 0; i < listaNum.size(); i++){
            if(listaNum.get(i) == e1){
                listaNum.set(i, e2);
                return true;
            }
        }
        return false;
    }

}
// ex9
public class Funcionario {
    String nome;
    String CPF;
    double salario;

    Funcionario(String n, String cp, double sal){
        nome = n;
        CPF = cp;
        salario = sal;
    }
}

public static void main (String argv [ ]){
     ArrayList<Funcionario> v = new ArrayList(10);

     v.add(new Funcionario("carolina","10392",1000.0));
     v.add(1,new Funcionario("epa","10392",1000.0));
     v.add(2,new Funcionario("mafalda","10392",1000.0));


     for(int i= 0; i < v.size();i++){
         if(v.get(i).nome == "carolina"){
             System.out.println("Achei");
             break;
         }
         System.out.println("Nao achei");
     }
 }

 // ex10

 public class ContaBancaria {
    int numero;
    String correntista;
    double saldo;

    ContaBancaria(int n, String nome, double s){
        numero = n;
        correntista = nome;
        saldo = s;
    }

    public double saque(double valor){
        if(valor > saldo)
            return -1;
        else
            saldo = saldo - valor;
        return saldo;
    }
}

 //fingir que é obanco
 public static void main (String argv [ ]){
     ArrayList<ContaBancaria> v = new ArrayList();

     v.add(0,new ContaBancaria(111,"carol",1000.00));
     v.add(1,new ContaBancaria(99,"epa",500.00));


     for(int i = 0; i < v.size(); i++){
         if(v.get(i).numero == 111){

             System.out.println(v.get(i).saque(90.00));
         }
     }

 }
