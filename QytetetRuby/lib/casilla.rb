# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module ModeloQytetet
  class Casilla
    
    #Atributos de la clase
    attr_reader :numeroCasilla, :coste, :tipo, :titulo
    attr_accessor :numHoteles, :numCasas
    
    def initialize(numeroCasilla, coste, tipo, titulo, numHoteles, numCasas)
      @numeroCasilla = numeroCasilla
      @coste = coste
      @tipo = tipo
      @titulo = titulo
      @numHoteles = numHoteles
      @numCasas = numCasas
    end
    
    #Contructor para casillas que son calle
    def self.crear_calle(numeroCasilla, coste, titulo)
      self.new(numeroCasilla, coste,TipoPropiedad::CALLE,titulo, 0, 0)
    end
    
    #construtor para casillas que no son calle
    def self.crear_no_calle(numeroCasilla, tipo)
      self.new(numeroCasilla, 0, tipo, nil, 0, 0)
    end
        
    def set_titulo_propiedad(titulo)
      @titulo = titulo
    end
    
    def to_s
      "Numero casilla #{@numeroCasilla}\nCoste #{@coste}\nTipo #{@tipo}\nTitulo = {\n#{@titulo.to_s()}}\n"+
       "Numero hoteles #{@numHoteles}\nNumero casas #{@numCasas}"
    end
    
    private :set_titulo_propiedad
  end
end
