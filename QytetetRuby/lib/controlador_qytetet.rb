# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'vista_textual_qytetet'
require_relative 'qytetet'
module InterfazTextualQytetet
  class Controlador_qytetet
    @@vista = VistaTextualQytetet.new
    @@juego = ModeloQytetet::Qytetet.instance;
    @@jugador
    @@casilla

    def self.incializar_juego()
        
        nombres = Array.new
        nombres << "Juan"
        nombres << "Pepe"
        @@juego.inicializar_juego(nombres)
        @@jugador = @@juego.jugador_actual
        @@casilla = @@jugador.casilla_actual
        @@vista.mostrar(@@juego.to_s)
        @@vista.pausa
    end
    
    def self.bancarrota
      return @@jugador.saldo <= 0
    end
    def self.desarrollo_juego
      #while(!bancarrota)
          @@vista.mostrar("Turno de: \n"+@@jugador.to_s)
          libre = true
          if(@@jugador.encarcelado)
            libre = false
            if(vista.menuSalirCarcel == 0)
              libre = @@juego.intentar_salir_carcel(MetodoSalirCarcel::PAGANDOLIBERTAD)
            else
              libre = @@juego.intentar_salir_carcel(MetodoSalirCarcel::TIRANDODADO)
            end
          end

          if(libre)
            @@vista.pausa
            notienepropietario = @@juego.jugar
            @@casilla = @@jugador.casilla_actual
            @@vista.mostrar("\n Estado actual del jugador: " + @@jugador.to_s);
            
            if(!bancarrota)
              if(!@@jugador.encarcelado)
                
                if(@@casilla.tipo == ModeloQytetet::TipoCasilla::CALLE)
                  @@vista.mostrar(@@casilla.to_s)
                  if(!notienepropietario)
                    comprar = @@vista.elegir_quiero_comprar
                    if(comprar)
                      if(@@juego.comprar_titulo_propiedad)
                        @@vista.mostrar("Se ha comprado la propiedad");
                      else
                        @@vista.mostrar("No se ha podido comprar la propiedad");                        
                      end
                    end
                  end
                end

                if(@@casilla.tipo == ModeloQytetet::TipoCasilla::SORPRESA)
                  @@vista.mostrar('Ha caido en la carta sorpresa\n')
                  @@vista.mostrar("La carte que le ha tocado es: " + @@juego.carta_actual.to_s() + "\n")
                  notienepropietario = @@juego.aplicar_sorpresa
                  @@casilla = @@jugador.casilla_actual
                  if( !@@jugador.encarcelado && !bancarrota &&@@casilla.tipo == ModeloQytetet::TipoCasilla::CALLE && !notienepropietario)
                    comprar = @@vista.elegir_quiero_comprar
                    if(comprar)
                      if(@@juego.comprar_titulo_propiedad)
                        @@vista.mostrar("Se ha comprado la propiedad");                            
                      else
                        @@vista.mostrar("No se ha comprado la propiedad");                            
                      end
                    end
                  end
                end
                
              end
            end

            
          end
      #end
    end
    ## --------------------el siguiente método va en ControladorQytetet
    def elegir_propiedad(propiedades) # lista de propiedades a elegir
      @@vista.mostrar("\tCasilla\tTitulo");
        
      listaPropiedades= Array.new
      for prop in propiedades  # crea una lista de strings con numeros y nombres de propiedades
        propString= prop.numeroCasilla.to_s+' '+prop.titulo.nombre; 
        listaPropiedades<<propString
      end
      seleccion=@vista.menu_elegir_propiedad(listaPropiedades)  # elige de esa lista del menu
      propiedades.at(seleccion)
    end
    
    def self.main
      self.incializar_juego
      self.desarrollo_juego
    end
    
    Controlador_qytetet.main
  end

end