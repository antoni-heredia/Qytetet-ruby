# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module ModeloQytetet
  class Casilla
    
    #Atributos de la clase
    attr_reader :numeroCasilla, :coste, :tipo
    attr_accessor :numHoteles, :numCasas, :titulo
    
    def initialize(numeroCasilla, coste, tipo, titulo)
      @numeroCasilla = numeroCasilla
      @coste = coste
      @tipo = tipo
      @titulo = titulo
      @numHoteles = 0
      @numCasas = 0
    end
    
    #Contructor para casillas que son calle
    def self.crear_calle(numeroCasilla, coste, titulo)
      self.new(numeroCasilla, coste,TipoPropiedad::CALLE,titulo)
    end
    
    #construtor para casillas que no son calle
    def self.crear_no_calle(numeroCasilla, coste, tipo)
      self.new(numeroCasilla, coste, tipo, nil)
    end
    

    
    #Devuelve un string con la informacion de la casill
    def to_s
      mensaje = "Numero casilla #{@numeroCasilla}\nCoste #{@coste}\nTipo #{@tipo}"
      
      if(tipo == TipoPropiedad::CALLE)
        mensaje += "\nTitulo = {\n#{@titulo.to_s()}}\nNumero hoteles #{@numHoteles}\nNumero casas #{@numCasas}"
      end
      
      return mensaje
    end
    
    private :titulo=
  end
end
