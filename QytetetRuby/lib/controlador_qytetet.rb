# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module InterfazTextualQytetet
  class Controlador_qytetet
    def initialize
      
    end
    #   # --------------------el siguiente método va en ControladorQytetet
    def elegir_propiedad(propiedades) # lista de propiedades a elegir
      @vista.mostrar("\tCasilla\tTitulo");
        
      listaPropiedades= Array.new
      for prop in propiedades  # crea una lista de strings con numeros y nombres de propiedades
        propString= prop.numeroCasilla.to_s+' '+prop.titulo.nombre; 
        listaPropiedades<<propString
      end
      seleccion=@vista.menu_elegir_propiedad(listaPropiedades)  # elige de esa lista del menu
      propiedades.at(seleccion)
    end

  end
end
