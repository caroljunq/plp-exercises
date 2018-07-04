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
