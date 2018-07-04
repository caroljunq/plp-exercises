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
