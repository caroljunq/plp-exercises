# Resumo P3 PLP
## Programação Estruturada
* Ou linguagens: convencionais, **imperativas ou procedurais**.
* **arquitetura de von Neumann** influencia linguagens (unidade processamento, memória, registradores)
* **Programa estruturado --> pois só lendo o código é possível
saber a sequência com que serão executados os processos ou o que está acontecendo=.**

### Conceitos
- variável, valor e atribuição
- **processamento sequencial**
- programa armazenado
 - **Modelo de máquina:** uma linguagem deve permitir usar diretamente uma máquina orientada por atribuições;

### Vocabulário (termos importantes)
* **Entidade**: variáveis, subprogramas, comandos
* **Atributos** variável (nome, tipo, valor), subprograma (nome, parametros)
* **Amarração:** definição de atributos de entidades. Associação entre entidades  de programação. Ex: uma variável e valor, um identificador e seu tipo.
  * Estática
  * Dinâmica
* **Alocação:**  pegar memória e associa com variável
* **Desalocação:** devolve memória da variável ao pool
* **Variável estática:** alocação antes da execução do programa
  * Variável global
  * Local estática
* **Variável dinâmica de pilha**
  * Ativação
  * Elaboração
  * Execução
* **Variável dinâmica de heap explicíta**: programador faz alocação e desalocação
* **Variável dinâmica de heap implícita:** programador não faz nada
* **Escopo**: onde variável é visível
* **Escopo estático** amarrações feitas em tempo de compilação
* **Escopo global** variaveis fora das funções
* **Escopo Dinâmica** vai tendo escopo do último lugar que foi chamado
* **Amiente de Referência** coleção de todas as variáveis visíveis no comando

### Variáveis
Abstração de célula(s) de memória --> não é célula física (1byte), célula abstrata tem o tamanho necessário para o tipo da variável.

#### Atributos
* **Nome:** identificador
* **Valor:** conteúdo da célula de memória associado a ela
* **Tipo:** determina intervalo de valores e conjunto de operações disponíveis
* **Endereço:** posição da memória associada. Uma variável pode ter endereços diferentes em momentos diferentes. Variáveis podem ter o mesmo endereço (UNION C --> só um valor na memória de cada vez)
* **Tempo de vida:** intervalo o qual uma área de memória está amarrada a uma variável
* **Escopo:** trecho do programa onde variável é conhecida

### Amarração
Definição de atributos de entidades. Associação entre entidades e seus atributos, especificar atributos de entidade. Ex: uma variável e valor, um identificador e seu tipo.

* **Tempo de amarração** momento em que amarração ocorre. **Diferenciar linguagens**
* **Tipos**

    * **Estática** antes do programa executar, não pode ser mudada
    * **Dinâmica** ocorre em tempo de execução, pode ser mudada

#### Amarração de atributos da variável
* **Valor**: representado de forma codificada na área de memória amarrada. Pode ser uma referência (ponteiro).

```
Amarração dinâmica é mais comum
Soma = 5 //comando de atribuição

Amarração Estática
const n = 50 //Pascal
```

* **Tipo**: intervalos de valores e funções disponíveis

##### Amarração de Tipo Estática
* definida através da declaração de variáveis
```
float x,y; //declaração explicíta
I,J,K,L //Fortran são inteiras, implícita
```

##### Amarração de Tipo Dinâmica
* váriaveis não são declaradas, váriavel pode conter valores de tipos diferentes durante execução;
* não coloco tipo
* tipo é definido quando valor é atribuído a esssa variável.
* **VANTAGENS**: flexibidade programação. Dá pra mudar as coisas mais vezes.
* **DESVANTAGES**:

  * Diminui chances do compilador detectar erros
  * custo mair verificação do tipo em tempo de execução
  * memória é de tamanho variável

* ex: **Javascript**, **python**


continua **Amarração e atributos da variável**
* **Tempo de vida** tempo que uma área de memória está amarrada a uma variável

  * **Alocação** pegar memórias disponíveis de um pool para uma variável
  * **Desalocação** devolve memória que foi desligada da variável para o pool


* **Endereço/Memória**: do ponto de vista de amarração de memória as VARIÁVEIS pode ser:
  - Estáticas
  - Dinâmica de pilha;
  - Dinâmicas de heap explícitas
  - Dinâmicas de heap implícitas

### Tipos de variável (segundo amarração de memória)
#### Variável Estática
* Tempo de vida da variável é até o programa terminar
* Alocação ocorre antes da execução do programa (tempo de compilação), nos casos de :
  * **Variáveis globais** - acessíveis a todo programa
  * **Variáveis Locais estáticas** - acessíveis dentro de subprogramas
* VANTAGENS: eficiência (endereçamento direto), não exige custo adicional para alocação e liberação da memória
* DESVANTAGENS: pouca flexibilidade (não permite subprogramas recursivos), nem compartilhamento de memória (subprogramas que executam em momentos diferentes e tem variáveis grandes)
* Ex:
  * Fortran - tudo era var estáticas
  * C, C++, Java - permite definir variável local estática
  * Pascal - não possui

```
//Em C
//Alocação em tempo de execução
#include <stdio.h>
static char* var = "global";
void main() {
 printf("%s\n", var);
}

Em Java
Em tempo de carregamento da classe
class Foo {
  public static String bar = "foobar";
}
```

#### Variáveis dinâmicas de pilha
* São alocadas da pilha de execução
* QUANDO APARECE
* criadas durante a elaboração de declaração
* alocada à memória no momento da declaração, mas tipo é definido estaticamente
* **Alocação** de memória é feita quando a declaração dessa variável é elaborada, mas o **tipo é amarrado estaticamente**
  * **Elaboração** processo de alocação que acontece no momento em que é iniciada a execução do código onde aparece a declaração da variável (ativação).
  * variáveis declaradas no início do procedimento
  * Ativação --> passa o controle pra quem foi chamado
  * Elaboração --> alocação de memória para função
  * Execução --> volta para quem chamou e libera memória (para que outras funções a use)

```
* P1,P2 e res terão memória alocada na pilha de execução após a chamada da função

int soma(int P1, int P2){
  //soma recebe P1,P2 e retorna um int
  int res;
  res = P1 + P2;
  return(res); //retornando o valor para a unidade que chamou
}

* Variáveis declaradas no início de um comando composto.
A elaboração acontece no início da execução do comando ou no início da execução da unidade.
 main (){
   int i = 0, x = 10;
   while (i++ < 100) {
     float z = 3.34;
  }
}

```

* Em algumas linguagens, variáveis podem ser declaradas em qualquer lugar
* Em algumas implementações, todas as variáveis declaradas em uma função são amarradas a memória no início da execução da função, mesmo que sua declaração não apareçam no começo.

* **A variável se torna visível a partir da sua declaração**
* VANTAGENS:
  * implementa recursão
  * subprogramas usam mesma memória
  * permite compartilhamento de memória

```
// Exemplo
#include <stdio.h>
int soma(int P1, int P2)
{ //soma recebe P1,P2 e retorna um int
 int res;
 res = P1 + P2;
 return(res); //retornando o valor para a unidade que chamou
}
void main()
{
 SOMA(2,10); //memória para parâmetros e res é alocada na pilha de execução
 SOMA(10,20); //memória para parâmetros e res pode ser alocada
 // na mesma posição que a chamada anterior
}
```

* DESVANTAGEM:
  * custo adicional de alocação, não significativo. As variáveis declaradas no início de um subprograma são alocadas juntas.
  * **C, C++, Java - variáveis são dinâmicas de pilha por default**
  * Pascal e ADA - todas as variáveis não heap de subprogramas são dinâmicas de pilha
  * endereçamento indireto

![](tempo_vida.png)

####  Variáveis dinâmicas de heap - explícitas
* alocadas dinamicamente e tamanho não é conhecido estaticamente, por isso usa-se células desorganizadas
*  São alocadas na heap (coleção de células de memória de uso desorganizado), pois é imprevísivel
* alocadas e desalocadas pelo programador durante execuçao do programa
* heap mantém células alocadas dinamicamente e altamente desorganizadas
* pode ser criada e destruída a qualquer momento
* Tempo de vida - enquanto existir referência para variável
* amarraçao estática, armazenamento dinâmico
* Células de memória sem nome são alocadas EXPLICITAMENTE por instruções do programador (chamada de um subprograma).
* linguagens possuem operador para liberar memória (free)
* ponteiros ou variáveis de referência
* **são usadas para implementar estruturas dinâmicas que crescem e diminuem durante execução**

```
C
Funções malloc, calloc e realloc: alocam memória
Função free: libera a memória reservada
void * malloc(int num_bytes);
void free(void * p);
// Exemplo em C
char *ptr;
ptr = malloc (10);
 // aloca memória na heap com o número de bytes
 // especificado – retorna ponteiro para primeira posição
.....
free(ptr)
```

```
C
int *node = malloc(sizeof(int));
/* ... */
free(node);

C++
int* node = new int;
/* ... */
delete node;

Java
Integer node = new Integer(10);
```

```
C++
Operador new –
• Seu operando é um tipo
• Aloca uma posição de memória na heap e retorna um ponteiro para
essa posição
int *intnode; // Cria um ponteiro
intnode = new int; // aloca uma posição de memória na
 // heap do tipo int
....
delete intnode; // desaloca a posição de memória
 // para a qual intnode aponta
C++ tem o operador delete porque não tem liberação de memória
implícita (garbage collection)


int * iPtr = new int[numTests];
 // aloca memória na heap com o número de bytes
 // especificado – retorna ponteiro para primeira posição
.....
 delete [] iPtr;
```

![](heap.png)

* **Java** --> todos os dados são objetos, dinâmicos de heap e acessados por variáveis de referência. Desalocaçao é feita pelo garbage collection

* VANTAGENS:
  * gestão dinâmica da memória
* DESVANTAGENS:
  * dificultadade de usar corretamente ponteiros
  * custo adicional de referência, alocação e desalocação.


#### Variáveis dinâmicas de heap - implícitas
* São alocados na heap apenas quando valores são atribuídos
* todos os atributos são definidos cada vez que os valores são atribuídos
* programador não faz nada
* VANTAGEM: alta flexibidade do tipo da variável, permite código genéricos
* DESVANTAGENS:
  * custo elevado, todos os atributos são dinâmicos
  * não permite verificação de erros pelo compilador

```
Javascript
Lista = [56.1 7.8 43.5 5.6]
```

**cont. sobre atributos da variável**
### Escopo
* onde variável é visível
* Local e não local

```
#include <stdio.h>
#include <conio.h>
//declaração de variáveis globais
// ---------------- Funçao main()-------------------
int main(void)
{
 //declaração das variáveis locais da main()
 return(0);
}
// -------------------------------------------------
void funcao1(variáveis locais de parâmetros)
{ // declaração das variáveis locais da função1
 return;
}
```
#### Escopo estático (léxico)
* Escopo das variáveis pode ser ESTÁTICO (ANTES DA EXECUÇÃO)
* Amarrações feitas em tempo de compilação
* 2 categorias de ling. com escopo estático:
  * subprogramas podem ser aninhados, criando escopos estáticos aninhados ex: Pascal e Javascript, PHP, C
  * subprogramas não podem ser aninhados, escopos aninhados são criados por classes aninhadas e blocos


![](aninhados.png)

* Quando uma variável é referenciada, seus atributos são
determinados pelo comando em que ela é declarada
* Quando uma variável é referenciada em um subprograma, sua
declaração é procurada nesse subprograma.
* Se não for encontrada, a busca continua no subprograma onde
esse mais interno foi definido (pai estático), e assim por diante.


![](aninhados2.png)

```
Em C
#include <stdio.h>
void main() {
  int i = 0;
  int x = 10;
  while (i++ < 100) {
    float x = 3.231;
    printf("x = %f\r\n", x * i);
  }
}
```

(![](c-escopo.png)

![](estatico-c.png)

##### Regras de escopo
* Uma variável é visível na unidade em que foi declarada
e nas internas, a menos que tenha sido redefinida.
* Uma nova declaração da mesma variável em uma
unidade mais interna **esconde a definição anterior**;
* Em ADA, variáveis escondidas, de escopos mais gerais,
podem ser acessadas com referências seletivas: P1.x

##### Blocos (seções de código)
* Algumas linguagens permitem que blocos tenham suas variáveis Locais
* são variáveis dinâmicas de pilha
* em C blocos estão entre { }
* **Escopos criados por blocos, que podem estar aninhados, são tratados
exatamente da mesma maneira que aqueles criados por subprogramas.**
* Algumas ling. C++ e Java, permitem que variáveis sejam definidas em qualquer lugar do bloco

```
01: int a = 13;
02: void f() {
03: int b = a; // Referência à variável do ponto 1
04: int a = 2;
05: b = b + a; // Referência à variável do ponto 4
06: }
```

* O escopo dessas variáveis é do ponto em que são
definidas até o final do bloco (ou função) em que
aparecem.

#### Escopo global
* variáveis definidas fora das funções
* visíveis em todas as Funções
* C, C++, PHP, Python
* ** Uma variável global em C é implicitamente visível em todas as funções subsequentes do arquivo, exceto naquelas que tem uma definição local para uma variável com mesmo nome**

#### Amarração Dinâmica a escopo --> importante pra caramba SERÁ QUE É ESCOPO DINÂMICO, pelo vi é sim ??
* O escopo é definido em função da execução do programa. O efeito de uma declaração se estende até que uma nova declaração com o mesmo nome seja encontrada.

![](amarracao3.png)

#### Escopo Dinâmico

* Vai tendo escopo do último lugar que foi chamado
* Baseado na sequência de ativação (chamadas) do programa
* amarrações em tempo de execução
* DESVANTAGENS
  * verificação de tipos em tempos de execução;
  * pouca legibilidade;
  * acesso lento a variáveis não locais
  *
![](c.png)

![](escopo-dinamico.png)

**REFERENTE A IMAGEM ANTERIOR IMPORTANTÍSSIMO** -->
  * As referências a um identificador não podem ser identificadas na compilação
  * Sequência - big, sub2, sub1 --> a referência a x em sub1 é ao X declarado em sub2
  * Sequência - big - sub1 --> a referência a x em sub1 é ao x declarado em big

### Ambiente de referência
* É a coleção de todas as variáveis que são visíveis no comandos
* O ambiente de referência de um comando em
uma linguagem de escopo estático é formado
pelas variáveis declaradas no seu escopo local
mais as declaradas nos escopos ancestrais que
são visíveis
* Conjuntos de todos os nomes visíveis em uma determinada instrução ou ponto do programa

![](ada.png)

![](ref1.png)

![](ref2.png)


### Verificação de Tipo
* Certifica-se que operandos (parametros, variáveis) e operadores (aritméticos, relacionais, subprogramas) são compatíves
* Exs:
  * subprogramas e parametros int func(int x){...}
  * atribuição (operador) e variveis (operandos) x = y + z
* Os operandos são aceitos se:
  * aceitos pelo operadores
  * podem ser convertidos implicitamente pelo compilador (**COERÇÃO**)
  * **ERRO TIPO**: operador aplicado a um operando inapropriado.

#### Verificação de tipo estática
* feita antes da execução
* amarração de tipo estática permite quase sempre a verificação de tipo estática (em tempo de compilação);
* VANTAGEM: detecção derros em tempo de compilaão, menor custo
* DESVANTAGEM: redução de flexibilidade para o programador

#### Verificação de tipo dinâmica
* durante execução do programa
* amarração do tipo dinâmica exige verificação do tipo dinâmica - tipo da variável é feita durante execução através de atribuição ex: JS
* unions, record variante (ada e pascal) --> verificação dinâmica deve ser feita quando a mesma posição de memória pode armazenar valores de tipos diferentes em momentos diferentes durante a execução
* O tamanho da union é o do maior objeto

### Tipagem forte
* Ling é fortemente tipada se pode identificar erro de tipos ou em tempo de execução ou compilação.
* Pascal, C , C++ não são, unions e records variantes não são checadas
* ADA quase é

### Conversão de tipo
* **COERÇÃO**: implicita, compilador, Fortran, C, C++
* **CASTING**: explicita, progrmador, ada, java, C#

```
Java permite esse tipo de coerção
int a;
float d,b;

b = d*a
```

```
Em ADA dá ruim, erro de tipo
A : Integer;
B, C, D : Float;
....
C := B * A;

```

### Estruturas de controle
* determinam fluxo de execução (que comando é executado depois do outro)
* em nível de comando
* em nível de **unidades**
  * mecanimos que permitem fazer chamadas a unidades **explicitas** (funções), **implícitas** (exceção, corrotinas, unidades concorrentes)
* **Unidades subordinadas chamadas explicitamente**
  * função - abstrai uma expressão a ser avaliada
    * retornam valores
    * ex: fatoral(n)
  * procedimento -abstrai comando a ser executado
    * modifica variáveis
    * ex: ordena(v)
```
PASCAL:
function <nome da função> ( <lista de argumentos> ) : <tipo>;
< corpo da função>
end
procedure <nome> (<parâmetros>);
<corpo>
End
```

### Parâmetros
  * **Formal** identificadores usados na definição da função
  * **Real** identificadores usados na chamada
  * **Argumento** ou real, ou valor passado do real para o formal

#### Correspondência entre Parâmetros Formais e Reais
* uso do critério posicional para amarração de argumentos: S(p1,p2,...,pn) --> chamada S(a1,a2,...,n)

#### Passagem de parâmetros
##### Passagem por Referências (sharing ou call by reference)
* passagem do endereço do argumento
* cara em termos de processamento, pois acesso é indireto
* a variável usada como argumento é **compartilhada e pode ser modificada**

![ ](passagem_ref.png)

![passagem-ref-c](passagem-ref-c.png)

![ref-c](ref-c.png)

![cpp](cpp.png)

##### Passagem por Cópia
* os parâmetros se comportam como variáveis locais
* custo de memória, pois se for elementos de comprimento grande
* Tipos:
  * **Por Valor:** argumentos iniciam parâmetros, que funcionam como variáveis locais.
![porvalor](porvalor.png)

  * **de Resultado:** parâmetros não recebem valores na chamada, funcionam como variáveis locais mas retornam valores de saída.
  * **de Valor-Resultado:** engloba os dois anteriores --> tem o mesmo efeito que a passagem por referência, semântica idêntica a de passagem por referência, exceto quanto os parâmetros reais envolvem arrays ou expressões

  ![valor1](valor1.png)

  ![valor2](valor2.png)

  ![res](res.png)

  ![res2](res2.png)

  ![res3](res3.png)

  ![res4](res4.png)

##### Passagem de Nome
* a amarração do parâmetro à posição não é feita na hora da chamada, mas a cada vez que ele é usado na unidade chamada. Portanto, atribuições ao mesmo parâmetro podem ser feitas a posições diferentes a cada ocorrência
* Parametro real substitui textualmente o parametro formal correspondente em todas as ocorrencias
* Param. formal é amarrado ao método de acesso no momento chamada mas a amarração a valor ou endereço é
feita só na hora que o parâmetro é atribuído ou referenciado.
* adia o cálculo de um argumento até ele seja realmente utilizado no procedimento
* objetivo flexibilidade
* mais lento

```
Algol --> final List[1] = 3, list[2] = 5
procedure BIGSUB;
integer GLOBAL;
integer array LIST [1:2];
procedure SUB (PARAM);
  integer PARAM;
  begin
  PARAM := 3;
  GLOBAL := GLOBAL + 1;
  PARAM := 5
  end;
begin
LIST [1] := 2;
LIST[2] := 2;
GLOBAL := 1;
SUB(LIST [GLOBAL])
end;
```
![nome](nome.png)

* ak é recalculado durante loop, pois k muda sempre
* ex: sum(i,1,100,v[i]) soma dos primeiros 100 primeiros termos de array
* soma de inteiros sum(i,1,100,i)
* soma de quadrados de inteiros sum(i,1,100,i*i)

### Sinônimia

```
Programa em sintaxe semelhante ao C:
int i = 3; /* i é uma variável global */
void fun (int a, int b) {
 i = b;
}
void main( ) {
 int list [10];
 list [i] = 5;
 fun(i, list[i]);
}
```
list[3] = 5
a = ender i
b = ender list[i]
i = 5

**O ENDEREÇO VAI E VOLTA PRO MESMO LUGAR**, copia de volta o endereço
![ressino](ressino.png)
![valorsino](valorsino.png)


## Subprogramas
* reuso de código
* facilita leitura
* economia tempo e memória
* único ponto de entrada
* UNIDADE CHAMADORA suspensa durante execução da chamada, único programa em cada momento. Depois retorna pra CHAMADORA

### Implementação de subprogramas
* **Ligação de subprograma:**  operação de chamada e retorno de subprograma
* Ações associadas a chamada da função:
  * passagem parâmetro;
  * variáveis locais não estáticas: alocar memória para variáveis locais declaradas no subprograma e associar as variáveis as suas memórias
  * salva status do subprograma chamador (status CPU, ponteiro ambiente)
  * transferir controle para subprograma chamado
  * garantir que retorno volte ao ponto certo após execução da função
  * se linguagem tiver subprogramas aninhados ou escopo global, garantir acesso a variáveis não Locais
* Ações relacionadas a retorno da função:
  * caso seja passagem por cópia, copiar valores dos parametros formais para os reais;
  * desalocar memoria das variáveis locais;
  * restauras status de execução da unidade chamadora
  * retonna controle para unidade chamadora

* necessidade de guardar infos não código;

 AGORA:
 * ling. escopo estático
 * variáveis locais dinâmicas de pilha
 * sem subprograma aninhado

### Registro de Ativação
* formato das informações não código que devem ser armazenadas durante a ativação
* //guarda **informações não código** durante chamada, execução e retorno de uma função
* **Pilha de execução** : guarda informações sobre ativações de subprogramas
* **Ativação** chamada da função
* **Instância de RA** coleção de particular de dados na forma de RA

  * **Formato Layout):**
  * determina quais as informações fazem parte do RA
  * conhecido em tempo de compilação

* **Tamanho:**
  * pode mudar quando variáveis locais tem tamanho variável (arrays)
  * conhecido em tempo de compilação quando as variáveis locais tem tamanho fixo
  * ADA --> tamanho do arrays locais depende de um parâmetro real

![RA](rA.png)

* **Endereço de Retorno** --> ponteiro para instrução seguinte à chamada da função
* **Vínculo Dinâmico** --> ponteiro para a base do RA do chamador. Em escopo estático,
utilizado para recuperar informação em tempo de execução quando ocorre erro. Em escopo dinâmico, acessar variáveis não locais.
* **Parâmetros** --> valor ou endereços fornecidos pelo chamador
  * Passagem por valor: valores são copiado para a pilha. Posição é usada como variável
  * Por Referência: endereço do parâmetro real na pilha
  * Por Resultado: Posição usada como variável local. Resultado copiado no parâmetro real.
  * Por Valor Resultado: combinação de por valor e resultado

![ra-ex](ra-ex.png)

### Pilha de execução
* último chamado, primeiro terminar
* criar instâncias de RA para funções numa Pilha
* parte da memória usada como pilha que guarda informações sobre ativações
* parte do sistema de execução
* **TODA ATIVAÇÃO** de subprograma recursiva ou não cria uma nova instância de RA na pilha (cópias separadas de parâmetros, variáveis locais e endereço de retorno)

### Implementação de subprogramas com variáveis locais dinâmicas de pilha
* caracteristica: implementam recursão
* compilador aloca e libera implicitamente memória
* pode haver múltiplas RA para o mesmo subprogramas
* instâncias de RA criadas dinamicamente

### Ponteiro de Ambiente de Execução (PE)
* usado para acessar variáveis locais e parâmetros durante a execução de um subprograma
* inicialmente aponta para a base do RA principal
* durante execução aponta para a base do RA (base da função) do subprograma que está sendo executado
* quando subprograma é chamado, PE atual é armazenado no novo RA como vínculo dinâmico
* novo valor de PE passa a ser base do novo RA criado
* quando ocorre retorno do subprograma, o ponteiro do topo da pilha é redefinido para o valor atual de PE menos 1
* o novo valor de PE passa a ser o valor do vínculos dinâmico do RA do suprograma que acabou de ser executado do subprograma que acabou de ser executado é removido da pilha

### Ações executadas durante processo de ligação pela unidade chamadora
* Ações da unidade chamadora:
  * cria instância do RA
  * salva status da execução da unidade de programa corrente
  * calcula e passa parametros
  * passa endereço de retorno para o chamado
  * transfere controle para o chamado

* Ações da unidade chamada:
  * salva o PE anterior na pilha como link dinâmico e cria o novo valor
  * aloca memória para variáveis locais
  * se passagem for por resultado ou valor resultado, copia esses valores nos parâmetros reais;
  * se o subprograma for uma função, move o valor funcional para um local acessível pelo chamador
  * restaurar o ponteiro da pilha (topo) atribuindo  o valor atual de PE menos 1 e atribuindo a PE o valor do antigo link dinâmico;
  * transfere controle para o chamador.


![conteudo-pilha](conteudo-pilha.png)

![continuacao](continuacao.png)

### Funções
* o formato de RA para funções inclui o valor que a função retorna
![funcoes](funcoes.png)


![funcao_retr](funcao_retr.png)

![p1](p1.png)

![p3](p3.png)

![p4](p4.png)

![p5](p5.png)


### Subprogramas aninhados
- Python, JS, PASCAL
* em um dado subprograma apenas as variáveis declaras em escopos de antecessores estáticos são visíveis e podem ser acessadas
* um subprograma é "chamável" apenas quado seus antecessores estáticos estão ativos
* Variáveis não locais (definidas em unidades mais externas) precisam ser acessadas e podem estar em subprogramas diferentes;
* variáveis não locais estão em RAs que já oram criados e estão em algum lugar da pilha
* para referẽncia não locais em linguagens de escopo estático é necessário encontrar todos os RA na pilha que corresponem aos ancestrais estáticos do subprograma;

### Encadeamento estático
* maneira de implementar escopo estático em linguagens e funções aninhadas
* Uso do **Vínculo estático:** ponteiro que aponta para a base do RA do pai estático do subgprograma e é utilizado para acessar variáveis não locais;
* **Encadeamento Estático** sequencia de vínculos estáticos que conectam RAs de subprogramas aninhados. Ocorre a ligação de cada RA aos seus ancestrais estáticos;

#### Encontrando referências não locais
* quando é feita uma referência a um variável não local, os ponteiros estáticos são percorridos até encontrar um RA que contenha essa variável;
* Alternativamente, como o aninhamento de escopos é conhecido em
tempo de compilação, o compilador pode determinar o tamanho da
cadeia a ser seguida para acessar a variável

### Vínculo Estático
* Em algumas lingagens o RA possui o Vínculo Estático
* **VíNCULO ESTÀTICO --> liga-se com a base do pai estático mais próximo**

![vestaticos](vestaticos.png)

![vepilha](vepilha.png)

### Blocos aninhados
* em C, e algumas outras linguagens, é permitido que haja variáveis para blocos. O tempo de vida delas começa quando entra no bloco e termina quando sai do bloco.

```
{
  int temp;
  temp = list[upper];
  list[upper] = list[lower];
  list[lower] = temp;
}
```
* VANTANGENS: não há conflito de nome de variável;
* o encadeamento estático pode ser usado em bloco aninhados, pois blocos são subprogramas sem parâmetros
* uma instância de RA é criada toda vez que o bloco é executado

* alternativa mais eficiente do que o encadeamento estático

* O espaço necessário para o bloco pode ser alocado após as variáveis locais
e acessados como se fossem variáveis locais, pois:
  * O tamanho do bloco é conhecido estaticamente
  * Blocos são iniciados e concluídos de forma textual


![blocos](blocos.png)
