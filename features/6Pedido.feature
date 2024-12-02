Feature: 
    Como un usuario de la página
    quiero poder conocer los costos de cada uno de mis productos a pedir
    para saber cuanto es el total a pagar considerando impuestos y costos de envio


Background:
    Given Estoy en el sitio de GMO online
    And hago click en el boton "Enter GMO Online"

Scenario: Verificar el total de un item al pedido
    When ingreso una "5" en el campo "Order Quantity" para un "3 Person Dome Tent "
    And hago click sobre el boton "Place An Order"
    And soy redirigido a la página "Place Order"
    Then verifico que el precio total calculado es correcto
    And verifico que se muestre los costos respectivos
        | field               | expected_value |
        | Sales Tax           | $ 75.00        |
        | Shipping & Handling | $ 5.00         |
        | Grand Total         | $ 1579.95      |
    When hago click en "Proceed with Order"
    Then soy redirigido a la página "Billing Information"

Scenario: Verificar el total de mas de dos items al pedido
      When ingreso las cantidades para los items
    | item                     | cantidad |
    | 3 Person Dome Tent       | 9        |
    | External Frame Backpack  | 2        |
    And hago click sobre el boton "Place An Order"
    And soy redirigido a la página "Place Order"
    Then verifico que el precio total calculado es correcto
    And verifico que se muestre los costos respectivos
        | field               | expected_value |
        | Sales Tax           | $ 152.99       |
        | Shipping & Handling | $ 5.00         |
        | Grand Total         | $ 3217.80      |
    When hago click en "Proceed with Order"
    Then soy redirigido a la página "Billing Information"