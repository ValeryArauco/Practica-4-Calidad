Feature: 
    Como un usuario de la pagina
    Quiero ver el detalle de un articulo
    disponible en la lista de articulos

Background:
    Given Estoy en el sitio de GMO online
    And hago click en el boton "Enter GMO Online"

Scenario Outline: Ver el detalle de un producto
    When hago click en el producto "<item>"
    Then observo el "<item>" del producto
    And observo el "<Item number>" del producto
    And observo el "<Unit Price>" del producto

    Examples:
    |Item number| item                      | Unit Price| 
    | 1000      | 3 Person Dome Tent        | $ 299.99  |
    | 1001      | External Frame Backpack   | $ 179.95  |
    | 1002      | Glacier Sun Glasses       | $ 67.99   |
    | 1003      | Padded Socks              | $ 19.99   |
    | 1004      | Hiking Boots              | $ 109.90  |
    | 1005      | Back Country Shorts       | $ 24.95	|

