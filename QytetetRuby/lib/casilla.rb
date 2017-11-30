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
    def self.crear_no_calle(numeroCasilla, tipo)
      self.new(numeroCasilla, nil, tipo, nil)
    end
    
    
    
    def esta_hipotecada
      return @titulo.hipotecada
    end
	
	def soy_edificable()
		return (@tipo == TipoCasilla::CALLE)
	end
    
    #Devuelve un string con la informacion de la casill
    def to_s
      mensaje = "\nNumero casilla #{@numeroCasilla}\nTipo #{@tipo}\n"
      
      if(tipo == TipoCasilla::CALLE)
        mensaje += "\nCoste #{@coste}\nTitulo = "+@titulo.to_s()+"\nNumero hoteles #{@numHoteles}\nNumero casas #{@numCasas}\n"
      end
      
      return mensaje
    end
    
    def tengo_propietario()
      return @titulo.tengo_propietario
    end
    
    def asignar_propietario(jugador)
      @titulo.propietario = jugador;
      return titulo;
    end
    
    def se_puede_edificar_casa
      return @numCasas < 4
    end
    
    def get_precio_edificar()
      @titulo.precio_edificar
    end
    
    def edificar_casa()
       @numCasas=@numCasas + 1
       return titulo.precio_edificar
    end
    
    def cobrar_alquiler
      coste_total = @titulo.alquiler_base
      coste_total += @numCasas * 0.5 + @numHoteles * 2;
      @titulo.cobrar_alquiler(coste_total);

      return coste_total;
    end
    
    def calcular_valor_hipoteca
      hipoteca_base = @titulo.hipoteca_base
      valor =  hipoteca_base + (@numCasas * 0.5 * hipoteca_base + @numHoteles * hipoteca_base);

      return valor;
    end
    
    def hipotecar
      @titulo.hipotecada = true
      cantidad_recibida = calcular_valor_hipoteca        
      return cantidad_recibida;
    end
    
    def preopietario_encarcelado()
      return @titulo.propietario_encarcelado
    end
    
    def vender_titulo()
      @numCasas = 0
      @numHoteles = 0
      @titulo.propietario = nil;
      puts @coste
      puts @numCasas
      puts @numHoteles
      puts @titulo.precio_edificar
      precio_compra = @numCasas + @numHoteles
      precio_compra = precio_compra * @titulo.precio_edificar
      precio_compra = precio_compra + @coste
      #precio_compra = @coste + (@nunCasas + @numHoteles) * @titulo.precio_edificar;
      precio_venta = precio_compra + @titulo.factor_revalorizacion * precio_compra
      
      return precio_venta
    end
    
    def se_puede_edificar_hotel()
      return @num_casas == 4
    end
    
    def edificar_hotel()
      @numCasas = @numCasas - 4
      return titulo.precio_edificar
    end
    
    def get_coste_hipoteca
      return calcular_valor_hipoteca * 1.1
    end
    
    def cancelar_hipoteca()
      valor_cancelar = get_coste_hipoteca
      titulo.hipotecada = false
      
      return valor_cancelar
    end    
=begin
    
    
    
    
    
    
    
    
    

    
    
    
    
    
    
    def precio_total_comprar()
      
    end
    
    
    
    
    
    
    
    
    
    
    
    

    
=end
    def asignar_titulo_propiedad()
      
    end
    private :titulo=,:asignar_titulo_propiedad
  end
end
