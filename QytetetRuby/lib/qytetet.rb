# encoding: UTF-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require "singleton"
require_relative "sorpresa"
require_relative "tablero"
require_relative "jugador"
require_relative "dado"

module ModeloQytetet
  class Qytetet
    include Singleton

    
    
    @@MAX_JUGADORES = 4
    @@MAX_CARTAS = 10
    @@MAX_CASILLAS = 20
    @@PRECIO_LIBERTAD = 200
    @@SALDO_SALIDA = 1000
    
    attr_accessor :carta_actual, :mazo, :jugadores, :jugador_actual, :tablero, :dado
    def initialize()
      @carta_actual = nil
      @mazo = Array.new(@@MAX_CARTAS)
      @jugadores = Array.new
      @jugador_actual = nil
      @tablero = nil
      @dado = Dado.instance
    end
    
    def self.MAX_CASILLAS
      @@MAX_CASILLAS
    end
    
    def self.MAX_JUGADORES
      @@MAX_JUGADORES
    end
    
    def self.MAX_CARTAS
      @@MAX_CARTAS
    end
    
    def self.MAX_LIBERTAD
      @@PRECIO_LIBERTAD
    end
    
    def self.MAX_SALIDA
      @@SALDO_SALIDA
    end
    
    def siguiente_jugador
      
      posicion_jugador = (@jugadores.rindex(@jugador_actual) + 1) % @@MAX_JUGADORES
      @jugador_actual = @jugador[posicion_jugador]
      
    end
    
    def salida_jugadores
      casilla = @tablero.obtener_casilla_numero(0)
      
      #inicializamos todos los jugadores en la salida
      @jugadores.each do |j|  
        j.actualizar_posicion(casilla)
        j.saldo(@@SALDO_SALIDA)
      end
      #elegimos un jugador al azar de todos los jugadores del array
      @jugador_actual = @jugadores.sample
    end
    
    def propiedades_hipotecadas_jugador(hipotecadas)
      casillas = Array.new
      
      @jugador_actual.propiedades each do |propiedad|
        if (propiedad.hipotecada == hipotecadas)
          casillas << propiedad
        end
      end
      
      return casillas
      
    end

=begin
    def aplicar_sorpresa
      
    end
    
    def cancelar_hipoteca(casilla)
      
    end
  
    def comprar_titulo_propiedad
      
    end
  
    def edificar_casa(casilla)
      
    end
    
    
    def edificar_hotel(casilla)
      
    end
    
    def hipotecar_propiedad(casilla)
      
    end
  
    
    
    def intentar_salir_carcel(metodo)
      
    end
    
    def jugar()
      
    end
    
    def obtener_ranking
      
    end
    
    
    
    
    
    def vender_propiedad(casilla)
      
    end
    
    def encarcelar_jugador
      
    end
    
    
=end
    
    def inicializar_cartas_sorpresa
      @mazo << Sorpresa.new("Te hemos pillado copiando en un examen " +
                            "¡Debes ir a la carcel!" , 9, 
                            TipoSorpresa::IRACASILLA)
      @mazo<< Sorpresa.new("Son las 15:15 y las 15:30 tienes practicas " + 
                            "de EC. Deberias ir a por un cafe antes.",12, 
                            TipoSorpresa::IRACASILLA)
      @mazo<< Sorpresa.new("Tu profesor no ha venido y no a avisado antes. " +
                            "Te toca ir a las mesas rojas",12, 
                            TipoSorpresa::IRACASILLA)
                          
      @mazo<< Sorpresa.new("El director de la ETSIIT se ha apiadado de ti." +
                            "Sales de la carcel.", 0, 
                            TipoSorpresa::SALIRCARCEL)
                          
      @mazo<< Sorpresa.new("Has suspendido PDOO en la convocatoria " +
                            "extraordinaria.¡Paga doble matricula!", -130, 
                            TipoSorpresa::PAGARCOBRAR)
      @mazo<< Sorpresa.new("Has conseguido una matricula de honor. " +
                            "¡ENHORABUENA EMPOLLON!. Te devuelven el dinero", 66, 
                            TipoSorpresa::PAGARCOBRAR)
                          
      @mazo<< Sorpresa.new("Empieza un nuevo mes. Tienes que hacerle la " +
                            "transferencia al casero.", -180, 
                            TipoSorpresa::PORCASAHOTEL)
      @mazo<< Sorpresa.new("El fin de curso a llegado. El casero te devuelve" +
                            "la fianza.", 180, 
                            TipoSorpresa::PORCASAHOTEL)
      @mazo<< Sorpresa.new("Tus compañeros te ofrecen dinero para que le " +
                             "pases las practicas. Todos hacen un bote " + 
                             "y te lo dan",25,
                            TipoSorpresa::PORJUGADOR)
      @mazo<< Sorpresa.new("Tus compañeros te han pillado copiandote. " + 
                            "Todos te piden dinero por su silencio. " + 
                            "Te toca pagar.", 15,
                            TipoSorpresa::PORJUGADOR)
    end
    
    def inicializar_jugadores(nombres)
      nombres.each do |nombre|
        @jugadores << Jugador.new(nombre)
      end
    end
    
    def inicializar_tablero
      @tablero = Tablero.new
    end
    
    def inicializar_juego(nombres)
        inicializar_tablero()
        inicializar_cartas_sorpresa()
        inicializar_jugadores(nombres)
    end
    
    def to_s
      cadena = ""
      
      if(@carta_actual != nil)
        cadena += "Carta actual: "+@carta_actual.to_s+"\n"
      end
      
      if(@jugador_actual != nil)
        cadena += "Jugador actual: "+@jugador_actual.to_s+"\n"
      end
      
      if(@tablero != nil)
        cadena += "Tablero: "+@tablero.to_s+"\n"
      end
      
      if(!@mazo.empty?)
        cadena += "Cartas: \n"
        @mazo.each do |carta|
          cadena += " " + carta.to_s
        end
      end
      
      if(!@jugadores.empty?)
        cadena += "Jugadores: \n"
        @jugadores.each do |jugador|
          cadena += " " + jugador.to_s
        end
      end
      
      return cadena
    end
    
    private  :inicializar_cartas_sorpresa, :inicializar_jugadores, :inicializar_tablero
    
    
  end
end
