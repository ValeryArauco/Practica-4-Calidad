Feature:
    Como un usuario de la pagina 
    quiero ver la lista de items ofertados en el catálogo
    para ordenar aquellos que me interesan.

Background:
    Given Estoy en el sitio de GMO online
    And hago click en el boton "Enter GMO Online"

Scenario: Ver todos los items
    Then veo la lista de items

    | 3 Person Dome Tent     |
    | External Frame Backpack|
    | Glacier Sun Glasses    |
    | Padded Socks           |
    | Hiking Boots           |
    | Back Country Shorts    |

Scenario: Agregar una cantidad específica de un item al pedido
    When ingreso una "<cantidad valida>" en el campo "Order Quantity" para un "<item>"
    And hago click sobre el boton "Place An Order"
    Then soy redirigido a la página "Place Order"

    Examples:
    | item                | cantidad valida |
    | 3 Person Dome Tent     | 324   |
    | External Frame Backpack| 32314 |


Scenario: No seleccionar ningún item
    When ingreso una "0" en el campo "Order Quantity" para un "<item>"
    And hago click sobre el boton "Place An Order"
    Then el sistema me muestra la advertencia "Please Order Something First"

    Examples:
    | item                |
    | 3 Person Dome Tent     |
    | External Frame Backpack|


Scenario: Ver error al ingresar cantidad no válida
    When ingreso una "<cantidad no valida>" en el campo "Order Quantity" para un "<item>"
    And hago click sobre el boton "Place An Order"
    Then el sistema me muestra la advertencia "Please enter only digits in this field."

    Examples:
    | item | cantidad no valida |
    | 3 Person Dome Tent     | -2   |
    | External Frame Backpack| texto |
    | Glacier Sun Glasses    | @#$  |
    | Padded Socks           | 5.5   |
    | Padded Socks           | 5,5   |