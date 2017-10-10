#encoding :utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative "sorpresa"
require_relative "tipo_sopresa"
require_relative "titulo_propiedad"
require_relative "casilla"
require_relative "tipo_casilla"
require_relative "tablero"
module ModeloQytetet
  class PruebaQytetet
    
    @@mazo = Array.new
    @@tablero = Tablero.new

    def self.inicializar_sorpresas
      
      @@mazo << Sorpresa.new("Te hemos pillado copiando en un examen " +
                            "¡Debes ir a la carcel!" , 9, 
                            TipoSorpresa::IRACASILLA)
      @@mazo<< Sorpresa.new("Son las 15:15 y las 15:30 tienes practicas " + 
                            "de EC. Deberias ir a por un cafe antes.",12, 
                            TipoSorpresa::IRACASILLA)
      @@mazo<< Sorpresa.new("Tu profesor no ha venido y no a avisado antes. " +
                            "Te toca ir a las mesas rojas",12, 
                            TipoSorpresa::IRACASILLA)
                          
      @@mazo<< Sorpresa.new("El director de la ETSIIT se ha apiadado de ti." +
                            "Sales de la carcel.", 0, 
                            TipoSorpresa::SALIRCARCEL)
                          
      @@mazo<< Sorpresa.new("Has suspendido PDOO en la convocatoria " +
                            "extraordinaria.¡Paga doble matricula!", -130, 
                            TipoSorpresa::PAGARCOBRAR)
      @@mazo<< Sorpresa.new("Has conseguido una matricula de honor. " +
                            "¡ENHORABUENA EMPOLLON!. Te devuelven el dinero", 66, 
                            TipoSorpresa::PAGARCOBRAR)
                          
      @@mazo<< Sorpresa.new("Empieza un nuevo mes. Tienes que hacerle la " +
                            "transferencia al casero.", -180, 
                            TipoSorpresa::PORCASAHOTEL)
      @@mazo<< Sorpresa.new("El fin de curso a llegado. El casero te devuelve" +
                            "la fianza.", 180, 
                            TipoSorpresa::PORCASAHOTEL)
      @@mazo<< Sorpresa.new("Tus compañeros te ofrecen dinero para que le " +
                             "pases las practicas. Todos hacen un bote " + 
                             "y te lo dan",25,
                            TipoSorpresa::PORJUGADOR)
      @@mazo<< Sorpresa.new("Tus compañeros te han pillado copiandote. " + 
                            "Todos te piden dinero por su silencio. " + 
                            "Te toca pagar.", 15,
                            TipoSorpresa::PORJUGADOR)

    end
    
    def self.obtener_sorpresas_valor_positivo
      sorpresas_positivas = Array.new
 
      @@mazo.each do |carta|
        if carta.valor > 0
          sorpresas_positivas << carta
        end    
      end
      
      return sorpresas_positivas
    end
    
    def self.obtener_sorpresas_ir_casilla
      sorpresas_ir_casilla = Array.new;
      
      @@mazo.each { |carta|
        if carta.tipo == TipoSorpresa::IRACASILLA
          sorpresas_ir_casilla << carta
        end
      }
      
      return sorpresas_ir_casilla
    end

    def self.buscar_sorpresas_por_tipo(tipo_casilla)
      sorpresas = Array.new;
      
      @@mazo.each { |carta|
        if carta.tipo == tipo_casilla
          sorpresas << carta
        end
      }
      
      return sorpresas
    end    
    
    def self.main
      
      PruebaQytetet.inicializar_sorpresas
      sorpresas_positivas = Array.new(PruebaQytetet.obtener_sorpresas_valor_positivo)
      sorpresas_ir_casilla = Array.new(PruebaQytetet.obtener_sorpresas_ir_casilla)
      sorpresas_elegida = Array.new(PruebaQytetet.buscar_sorpresas_por_tipo(TipoSorpresa::SALIRCARCEL))

      puts "-----Todas las cartas-----"
      @@mazo.each do |mazo|
        puts mazo.to_s
      end
      
      puts "-----Cartas valor positivo-----"
      sorpresas_positivas.each do |mazo|
        puts mazo.to_s
      end
      
      puts "-----Cartas tipo IRACASILLA-----"
      sorpresas_ir_casilla.each do |mazo|
        puts mazo.to_s
      end
      
      puts "-----Cartas tipo elegido por tipo-----"
      sorpresas_elegida.each do |mazo|
        puts mazo.to_s
      end
      
      puts "-----Tablero-----"
      puts @@tablero.to_s
      
      puts "-----Casilla Carcel-----"
      puts @@tablero.carcel.numeroCasilla
    end
    
  end
  PruebaQytetet.main
  
end