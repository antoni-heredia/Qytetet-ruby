# encoding: UTF-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module ModeloQytetet
  class Tablero
    attr_reader :carcel, :casillas
    
    def initialize
      inicializar
    end
    
    def inicializar
      @casillas = Array.new;
      #Se crea el objeto carcel
      @carcel = Casilla.crear_no_calle(5,000,TipoCasilla::CARCEL)
      
      @casillas << Casilla.crear_no_calle(0, 000, TipoCasilla::SALIDA)
      
      @casillas << Casilla.crear_calle(1, 000,
        TituloPropiedad.crear("Mesas rojas",50,0.11,150,250) )
      
      @casillas << Casilla.crear_no_calle(2, 000, TipoCasilla::SORPRESA)
      
      @casillas << Casilla.crear_calle(3, 000, 
        TituloPropiedad.crear("Biblioteca", 65, 0.1, 200, 300))
      
      @casillas << Casilla.crear_calle(4, 000, 
        TituloPropiedad.crear("Cafeteria", 70, 0.12, 350, 350))
      
      #Se añade la carcel en el tablero
      @casillas << @carcel;
      
      @casillas << Casilla.crear_calle(6, 000, 
        TituloPropiedad.crear("Secretaria", 85, 0.14, 300, 600))
      
      @casillas << Casilla.crear_no_calle(7, 000, TipoCasilla::SORPRESA)
      
      @casillas << Casilla.crear_calle(8, 000,
        TituloPropiedad.crear("Anfiteatro", 60, 0.16, 400, 275) )
      
      @casillas << Casilla.crear_calle(9, 000,
        TituloPropiedad.crear("Aulas pefabricadas", 90, 0.11, 425, 725) )
      
      @casillas << Casilla.crear_no_calle(10, 000, TipoCasilla::PARKING)
      
      @casillas << Casilla.crear_calle(11, 000, 
        TituloPropiedad.crear("Departamento LSI", 100, 0.17, 700, 750))
      
      @casillas << Casilla.crear_no_calle(12, 000, TipoCasilla::SORPRESA)
      
      @casillas << Casilla.crear_calle(13, 000,
        TituloPropiedad.crear("Departamento DECSAI", 100, 0.16, 750, 400))
      
      @casillas << Casilla.crear_calle(14, 000, 
        TituloPropiedad.crear("Departamento ATC", 90, 0.15, 625, 575))
      
      @casillas << Casilla.crear_no_calle(15, 000, TipoCasilla::JUEZ)
      
      @casillas << Casilla.crear_calle(16, 000,
        TituloPropiedad.crear("Aulario", 150, 0.16, 550, 600))
      
      @casillas << Casilla.crear_no_calle(17, 000, TipoCasilla::IMPUESTO)
      
      @casillas << Casilla.crear_calle(18, 000, 
        TituloPropiedad.crear("Copisteria", 65, 0.18, 475, 625))
      
      @casillas << Casilla.crear_calle(19, 000, 
        TituloPropiedad.crear("CITIC", 90, 0.2, 480, 450))
      
    end
    
=begin

    def es_casilla_carcel(num_casilla)
      
    end
    
    def obtener_casilla_numero(numero_casilla)
      
    end
    
    def obtener_casilla_nueva(casilla, desplazamiento)
      
    end
=end    
    
    def to_s
      
      texto = ""
      @casillas.each do |casilla|
        texto += casilla.to_s
      end
      return texto
    end
    
    
    
    private :inicializar
  end
end
