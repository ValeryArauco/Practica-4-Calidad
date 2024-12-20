Feature: 
    Como un usuario de la página 
    quiero que solo se permitan cantidades válidas en el campo de pedido
    para evitar problemas al procesar mi compra.

Background:
    Given Estoy en el sitio de GMO online
    And hago click en el boton "Enter GMO Online"

Scenario Outline: Agregar una cantidad específica de un item al pedido
    When ingreso una "<cantidad valida>" en el campo "Order Quantity" para un "<item>"
    And hago click sobre el botón "Place An Order"
    Then soy redirigido a la página "Place Order"

    Examples:
      | item                     | cantidad valida |
      | 3 Person Dome Tent       | 324             |
      | External Frame Backpack  | 32314           |

Scenario Outline: No seleccionar ningún item
    When ingreso una "0" en el campo "Order Quantity" para un "<item>"
    And hago click sobre el botón "Place An Order"
    Then el sistema me muestra la advertencia "Please Order Something First"

    Examples:
      | item                     |
      | 3 Person Dome Tent       |
      | External Frame Backpack  |

Scenario Outline: Ver error al ingresar cantidad no válida
    When ingreso una "<cantidad no válida>" en el campo "Order Quantity" para un "<item>"
    And hago click sobre el botón "Place An Order"
    Then el sistema me muestra la advertencia "Please enter only digits in this field."

    Examples:
      | item                     | cantidad no válida |
      | 3 Person Dome Tent       | -2                 |
      | External Frame Backpack  | texto              |
      | Glacier Sun Glasses      | @#$                |
      | Padded Socks             | 5.5                |
      | Padded Socks             | 5,5                |
