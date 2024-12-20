Feature: 
    Como un usuario de la página
    quiero poder conocer los costos de cada uno de mis productos a pedir
    para saber cuanto es el total a pagar considerando impuestos y costos de envio


Background:
    Given Estoy en el sitio de GMO online
    And hago click en el boton "Enter GMO Online"

Scenario: Verificar estado de envío para todos los productos
    When ingreso las cantidades para los items
    | item                     | cantidad |
    | 3 Person Dome Tent       | 4        |
    | External Frame Backpack  | 3        |
    | Hiking Boots             | 12       |
    And hago click sobre el boton "Place An Order"
    Then verifico que todos los productos tengan estado "To Be Shipped"

Scenario: Verificar el total de un item al pedido
    When ingreso una "5" en el campo "Order Quantity" para un "3 Person Dome Tent "
    And hago click sobre el boton "Place An Order"
    And soy redirigido a la página "Place Order"
    And verifico que el Grand Total sea correcto
    Then hago click en "Proceed with Order"
    And soy redirigido a la página "Billing Information"

Scenario: Verificar el total de mas de dos items al pedido
    When ingreso las cantidades para los items
    | item                     | cantidad |
    | 3 Person Dome Tent       | 9        |
    | External Frame Backpack  | 2        |
    And hago click sobre el boton "Place An Order"
    And soy redirigido a la página "Place Order"
    And verifico que el Grand Total sea correcto 
    Then hago click en "Proceed with Order"
    And soy redirigido a la página "Billing Information"

Scenario: Verificar cálculo con cantidades muy grandes permitidas en el sitio
    When ingreso las cantidades para los items
    | item                     | cantidad |
    | 3 Person Dome Tent       | 999999    |
    | External Frame Backpack  | 999999    |
    | Hiking Boots             | 999999    |
    And hago click sobre el boton "Place An Order"
    And soy redirigido a la página "Place Order"
    And verifico que el Grand Total sea correcto 
    Then hago click en "Proceed with Order"
    And soy redirigido a la página "Billing Information"

Scenario: Verificar precisión de cálculos con decimales
    When ingreso una "7.5" en el campo "Order Quantity" para un "External Frame Backpack"
    And presiono la tecla "Enter"
    And soy redirigido a la página "Place Order"
    Then verifico que el Grand Total sea correcto 

Scenario: Verificar precisión de cálculos con decimales
    When ingreso una "a" en el campo "Order Quantity" para un "External Frame Backpack"
    And presiono la tecla "Enter"
    And soy redirigido a la página "Place Order"
    Then verifico que el Grand Total sea correcto 