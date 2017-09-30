#encoding :utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative "sorpresa"
require_relative "tipo_sopresa"
module ModeloQytetet
  class PruebaQytetet
    @@mazo = Array.new
    
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
                            TipoSorpresa::PORCASAHOTEL)
      @@mazo<< Sorpresa.new("Tus compañeros te han pillado copiandote. " + 
                            "Todos te piden dinero por su silencio. " + 
                            "Te toca pagar.", 15,
                            TipoSorpresa::PORCASAHOTEL)

    end
    def self.obtener_sorpresas_valor_positivo
      sorpresas_positivas = Array.new
 
      @@mazo.each do |mazo|
        if mazo.valor > 0
          sorpresas_positivas << mazo
        end    
      end
      
      return sorpresas_positivas
    end
    
    def self.main
      
      PruebaQytetet.inicializar_sorpresas
      sorpresas_positivas = Array.new(PruebaQytetet.obtener_sorpresas_valor_positivo)

      @@mazo.each do |mazo|
        puts mazo.to_s
      end
      
      sorpresas_positivas.each do |mazo|
        puts mazo.to_s
      end
      
      
    end
    
  end
  PruebaQytetet.main
  
end