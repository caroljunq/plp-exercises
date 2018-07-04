// POO Lista

public class Pessoa{
  private String nome;
  private String sobrenome;

  Pessoa(String n, String s){
    nome = n;
    sobrenome = s;
  }

  void getName(){
    return nome;
  }

  void getSobre(){
    return sobrenome;
  }

  void getFullName(){
    return noma+' ' + sobrenome;
  }
}
public class Livro{
  Pessoa autor;
  String title;
  int numPages;

  Livro(Pessoa p, String t, int n){
    autor = p;
    title = t;
    numPages = n;
  }
}

// -----------------------
// 2
public class Hora{
  int hora;
  int minutos;
  int segundos;
}

public class Tarefa{
  Hora inicio;
  Hora fim;
  String titulo;
  String usuario.
}
// -----------------------------------------
// 3
class Categoria{
  String nome;
  Categorias subs[];
}
// ----------------------------
// 4
class Arquivo{
  String nome, localizacao;
  int tamanho;
  Anotacao anotacoes[];
}

class Anotacao{
  String titulo, data;
  Arquivo associacao;
}

class Coordenada{
  int x,y;
}

class Visual extends Anotacao{
  Coordenadas coordenadas[];
}

class Textual extends Anotacao{
  String texto;
}
// -------------------------
// 9
public class Cliente{
  private String nome;
  private String endereco;
  private List<Secao> secoes[];

  Cliente(String n, String end){
    nome = n;
    endereco = end;
    secoes = new ArrayList<Secao>();
  }

  String getName(){
    return nome;
  }

  String getEnd(){
    return endereco;
  }

  void updateName(String novo){
    nome = novo;
  }

  void updateEnder(String novo){
    endereco = novo;
  }

  Secao[] getSecoes(){
    return secoes;
  }

  void addSecao(Secao nova){
    sessoes.add(nova);
  }
}


public PessoaFisica extends Cliente{
  private String cpf;

  PessoaFisica(String n, String end, String cpf){
    super(n,end);
    this.cpf = cpf;
  }

  void getCpf(){
    return cpf;
  }

  void updateCpf(String novo){
    cpf = novo;
  }
}

public PessoaJuridica extends Cliente{
  private String cnpj;

  PessoaJuridica(String n, String end, String cnpj){
    super(n,end);
    this.cnpj = cnpj;
  }

  void getCnpj(){
    return cnpj;
  }

  void updateCnpj(String novo){
    cnpj = novo;
  }
}

public class Secao{
  private String nome;
  private List<Produto> produtos;

  Secao(String n){
    nome = n;
    produtos = new ArrayList<Produto>();
  }

  void getName(){
    return nome;
  }

  void setNome(String nome){
    this.nome = nome;
  }

  Produto[] getProdutos(){
    return (Produto[]) produtos.toArray();
  }

  void adicionarProduto(Produto produto){
    if(produtos.size() < 10){
      produtos.add(produto);
    }
  }
}

class Produto{
  int codigo;
  String descricao;


  Produto(int c, String d){
    codigo = c;
    descricao = d;
  }
}

class Opiniao{
  String texto;
  int nota;

  Opiniao(String t, int n){
    texto = t;
    nota = n;
  }
}
