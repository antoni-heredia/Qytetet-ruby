# encoding: UTF-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative "titulo_propiedad"

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
      if(titulo != nil)
        titulo.casilla = self
      end
    end
    
    #Contructor para casillas que son calle
    def self.crear_calle(numeroCasilla, coste, titulo)
      self.new(numeroCasilla, coste,TipoCasilla::CALLE,titulo)
    end
    
    #construtor para casillas que no son calle
    def self.crear_no_calle(numeroCasilla, coste, tipo)
      self.new(numeroCasilla, coste, tipo, nil)
    end
    
    
    
    def esta_hipotecada
      return @titulo.hipotecada
    end
	
	def soy_edificable()
		return (@tipo == TipoCasilla::CALLE)
	end
    
    #Devuelve un string con la informacion de la casill
    def to_s
      mensaje = "\nNumero casilla #{@numeroCasilla}\nCoste #{@coste}\nTipo #{@tipo}\n"
      
      if(tipo == TipoCasilla::CALLE)
        mensaje += "\nTitulo = "+@titulo.to_s()+"\nNumero hoteles #{@numHoteles}\nNumero casas #{@numCasas}\n"
      end
      
      return mensaje
    end
    
    
=begin
    def asignar_propietario(jugador)
      
    end
    
    def calcular_valor_hipoteca()
      
    end
    
    def cancelar_hipoteca()
      
    end
    
    def cobrar_alquiler()
      
    end
    
    def edificar_casa()
      
    end
    
    def edificar_hotel()
      
    end
    

    def get_coste_hipoteca()
      
    end
    
    def get_precio_edificar()
      
    end
    
    def hipotecar()
      
    end
    
    def precio_total_comprar()
      
    end
    
    def preopietario_encarcelado()
      
    end
    
    def se_puede_edificar_casa()
      
    end
    
    def se_puede_edificar_hotel()
      
    end
    
    
    
    def tengo_propietario()
      
    end
    
    def vender_titulo()
      
    end

    
=end
    def asignar_titulo_propiedad()
      
    end
    private :titulo=,:asignar_titulo_propiedad
  end
end
