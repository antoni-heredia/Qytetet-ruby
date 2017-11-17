# encoding: UTF-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module ModeloQytetet
  class Jugador
    attr_reader :nombre, :propiedades, :saldo
    attr_accessor :casillaActual, :encarcelado, :carta_libertad
  
    def initialize(nombre)
      @encarcelado = false
      @nombre = nombre
      @saldo = 7500
      @carta_libertad = nil
      @casilla_actual = nil
      @propiedades = Array.new
    end
    
    def to_s
      cadena = "Nombre: #{@nombre} \nSaldo: #{@saldo} \n"
      
      if (@carta_libertad != nil)
        cadena += "Carta libertad: " + @carta_libertad.to_s + "\n"
      end
      
      if (@casilla_actual != nil)
        cadena += "Casilla Actual: " + @casilla_actual.to_s + "\n"
      end
      
      if (!@propiedades.empty?)
        
        cadena += "Propiedades: "
        @propiedades.each do |propiedad|
          cadena += " " + propiedad.to_s;
        end
        
      end
      return cadena
    end
    
    def devolver_carta_libertad
      
      if(@carta_libertad != nil)
        sorpresa = @carta_libertad
        @carta_libertad = nil
      end
      
      return sorpresa
      
    end
    
    def tengo_carta_libertad
      libertad = false
      if(@carta_libertad != nil)
        libertad = true
      end
      
      return libertad
    end
    
    def puedo_vender_propiedad(casilla)
      estado = false
      if(es_de_mi_propiedad(casilla) && !casilla.titulo.esta_hipotecada)
        estado = true
      end
      
      return estado
    end
    
    def modificar_saldo(cantidad)
      @saldo += cantidad
    end
    
    def tengo_propiedades
      return !@propiedades.empty?
    end
	
	
	def cuantas_casas_hoteles_tengo
		cant = 0

		@propiedades.each do |p|
			cant +=  p.casilla.numHoteles + p.casilla.numCasas
		end

		return cant
	end

	def obtener_capital
		capital = @saldo
		
		@propiedades.each do |p|	
			capita += p.casilla.coste
			capital += self.cuantas_casas_hoteles_tengo*t.precio_edificar
			
			if(t.hipotecada)
				capital -= t.hipoteca_base
			end
		end

        return capital
	end

	def es_de_mi_propiedad(casilla)
		f = false;

		@propiedades.each do |p|
      if(p.casilla.numeroCasilla == casilla.numeroCasilla)
          f = true	
      end			
    end    
    
    return f
	end
	
	def eliminar_de_mis_propiedades(casilla)
		@propiedades.delete_if{ |x| x.numeroCasilla == casilla.numeroCasilla}		
	end

	def obtener_propiedades_hipotecadas(hipotecada)
		hipotecadas = Array.new

		@propiedades.each do |p|
			if(p.hipotecada && hipotecada)
				hipotecadas << p
			end

			if(!p.hipotecada && !hipotecada)
				hipotecadas << p
			end
		end
		return hipotecadas
	end

	def tengo_saldo(cantidad)
		return cantidad >= @saldo
	end

	def actualizar_posicion(casilla)
      
	end
	
	
    
=begin

    def comprar_titulo
      
	end
	
    def ir_a_carcel(casilla)
      
    end  

    

    def pagar_cobrar_por_casa_hotel(cantidad)

    end
      
    def pagar_libertad(cantidad)
      
    end
      
    def puedo_edificar_casa(casilla)

    end

    def puedo_edificar_hotel(casilla)

    end

    def puedo_hipotecar(casilla)

    end

    def puedo_pagar_hipoteca(casilla)

    end

    def vender_propiedad(casilla)

    end
    
    

=end
      
      
	private :cuantas_casas_hoteles_tengo, :es_de_mi_propiedad, :eliminar_de_mis_propiedades, :tengo_saldo
  end
end
