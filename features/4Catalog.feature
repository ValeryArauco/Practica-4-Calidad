Feature:
    Como un usuario de la pagina 
    quiero ver la lista de items ofertados en el catálogo
    para explorar los productos disponibles.

Background:
    Given Estoy en el sitio de GMO online

Scenario: Ver todos los items
    When hago click en el boton "Enter GMO Online"
    Then veo la lista de items

    | 3 Person Dome Tent     |
    | External Frame Backpack|
    | Glacier Sun Glasses    |
    | Padded Socks           |
    | Hiking Boots           |
    | Back Country Shorts    |

