Feature: Catálogo
    Como un usuario de la pagina 
    quiero ver la lista de items ofertados en el catálogo
    para ordenar aquellos que me interesan.

Background:
    Given Estoy en el sitio de GMO online
    And hago click en el boton "Enter GMO Online"



Scenario: Resetear el formulario
    When ingreso cantidades validas a ordenar para los items
        | item                     | cantidad |
        | 3 Person Dome Tent       | 1        |
        | External Frame Backpack  | 2        |
        | Glacier Sun Glasses      | 3        |
        | Padded Socks             | 4        |
        | Hiking Boots             | 5        |
        | Back Country Shorts      | 6        |
    And hago click sobre el boton "Reset Form"
    Then la cantidad de items a ordenar se reinician a cero
        | item                     |
        | 3 Person Dome Tent       |
        | External Frame Backpack  |
        | Glacier Sun Glasses      |
        | Padded Socks             |
        | Hiking Boots             |
        | Back Country Shorts      |
