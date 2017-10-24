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
require_relative "qytetet"

module ModeloQytetet
  class PruebaQytetet
 
    
    def self.main
      @juego = Qytetet.instance
    end
    
  end
  PruebaQytetet.main
  
end