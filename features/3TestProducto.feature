Feature: 
    Como un usuario de la pagina
    Quiero ver el detalle de un articulo
    disponible en la lista de articulos

Background:
    Given Estoy en el sitio de GMO online
    And hago click en el boton "Enter GMO Online"

Scenario: No seleccionar ningún item
    When hago click en el producto "<item>"
    Then observo el detalle del "<item>"

    Examples:
    | item                      |
    | 3 Person Dome Tent        |
    | External Frame Backpack   |
    | Glacier Sun Glasses       |
    | Padded Socks              |
    | Hiking Boots              |
    | Back Country Shorts       |

