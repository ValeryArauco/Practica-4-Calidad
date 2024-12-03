Feature: Como Administrador
    quiero comprobar si el proceso de
    Facturacion es correcto en formato
    estadounidense

Background:
    Given Estoy en el sitio de GMO online
    And hago click en el boton "Enter GMO Online"
    And ingreso cantidades validas a ordenar para los items
    | item                     | cantidad |
    | Glacier Sun Glasses      | 1        |
    | Hiking Boots             | 1        |
    And hago click sobre el boton "Place An Order"
    And hago click en el boton "Proceed With Order"

Scenario: Confirmar compra con datos repetisdos en casilla "Bill To" y "Ship To"
    When Lleno las casillas para factura en "Bill To"
    |Name       | Pepito             |
    |Address 	| Muyurina           |
    |City 	    | Cochabamba         |
    |State      | Cochabamba         |
    |Zip        | 33125              |
    |Phone   	| 123-123-1234       |
    |E-mail  	| pepe@pepazo.com    |
    And Lleno las casillas para factura en "Ship To"
    |Name       | Pepito             |
    |Address 	| Muyurina           |
    |City 	    | Cochabamba         |
    |State      | Cochabamba         |
    |Zip        | 33125              |
    |Phone   	| 123-123-1234       |
    And Lleno las casillas de tarjeta
    |Credit Card| American Express  |
    |Card Number| 1234-123456-12345 |
    |Expiration	| 11/25             |
    And hago click en el boton "Place The Order"
    Then soy redirigido a la página "OnLine Store Receipt"

Scenario: Copiar la informacion introducida en "Bill To" a "Ship To"
    When Lleno las casillas para factura en "Bill To"
    |Name       | Pepito             |
    |Address 	| Muyurina           |
    |City 	    | Cochabamba         |
    |State      | Cochabamba         |
    |Zip        | 33125              |
    |Phone   	| 123-123-1234       |
    |E-mail  	| pepe@pepazo.com    |
    And Hago click en la casilla "Same as Bill To"
    Then deberia tener los mismos datos en la casillas de Ship To
    |Name       | Pepito             |
    |Address 	| Muyurina           |
    |City 	    | Cochabamba         |
    |State      | Cochabamba         |
    |Zip        | 33125              |
    |Phone   	| 123-123-1234       |

Scenario: No introduzco un dato valido en la casilla de Phone
    When Lleno las casillas para factura en "Bill To"
    |Name       | Pepito             |
    |Address 	| Muyurina           |
    |City 	    | Cochabamba         |
    |State      | Cochabamba         |
    |Zip        | 33125              |
    |Phone   	|  324               |
    |E-mail  	| pepe@pepazo.com    |
    And Hago click en la casilla "Same as Bill To"
    And hago click en el boton "Place The Order"
    Then deberia mostrarme una alerta de invalidacion de "Phone"

Scenario: No introduzco un dato valido en la casilla de Zip
    When Lleno las casillas para factura en "Bill To"
    |Name       | Pepito             |
    |Address 	| Muyurina           |
    |City 	    | Cochabamba         |
    |State      | Cochabamba         |
    |Zip        | 1              |
    |Phone   	| 123-123-1234       |
    |E-mail  	| pepe@pepazo.com    |
    And Hago click en la casilla "Same as Bill To"
    And hago click en el boton "Place The Order"
    Then deberia mostrarme una alerta de invalidacion de "Zip"

Scenario: No introduzco un dato valido en la casilla de Card Number
    When Lleno las casillas para factura en "Bill To"
    |Name       | Pepito             |
    |Address 	| Muyurina           |
    |City 	    | Cochabamba         |
    |State      | Cochabamba         |
    |Zip        | 33125              |
    |Phone   	| 123-123-1234       |
    |E-mail  	| pepe@pepazo.com    |
    And Hago click en la casilla "Same as Bill To"
    And Lleno las casillas de tarjeta
    |Credit Card| American Express  |
    |Card Number| 1 |
    |Expiration	| 11/25             |
    And hago click en el boton "Place The Order"
    Then deberia mostrarme una alerta de invalidacion de "Card Number"

Scenario: Introduzco una fecha ya pasada en Expiration
    When Lleno las casillas para factura en "Bill To"
    |Name       | Pepito             |
    |Address 	| Muyurina           |
    |City 	    | Cochabamba         |
    |State      | Cochabamba         |
    |Zip        | 33125              |
    |Phone   	| 123-123-1234       |
    |E-mail  	| pepe@pepazo.com    |
    And Hago click en la casilla "Same as Bill To"
    And Lleno las casillas de tarjeta
    |Credit Card| American Express  |
    |Card Number| 1234-123456-12345 |
    |Expiration	| 11/20             |
    And hago click en el boton "Place The Order"
    Then deberia mostrarme una alerta de invalidacion de "Expiration"

Scenario: Introduzco letras en Expiration
    When Lleno las casillas para factura en "Bill To"
    |Name       | Pepito             |
    |Address 	| Muyurina           |
    |City 	    | Cochabamba         |
    |State      | Cochabamba         |
    |Zip        | 33125              |
    |Phone   	| 123-123-1234       |
    |E-mail  	| pepe@pepazo.com    |
    And Hago click en la casilla "Same as Bill To"
    And Lleno las casillas de tarjeta
    |Credit Card| American Express  |
    |Card Number| 1234-123456-12345 |
    |Expiration	| dasda             |
    And hago click en el boton "Place The Order"
    Then deberia mostrarme una alerta de invalidacion de "Expiration"

Scenario: Introduzco numeros en la casilla City 
    When Lleno las casillas para factura en "Bill To"
    |Name       | Pepito             |
    |Address 	| Muyurina           |
    |City 	    | 432324         |
    |State      | Cochabamba         |
    |Zip        | 33125              |
    |Phone   	| 123-123-1234       |
    |E-mail  	| pepe@pepazo.com    |
    And Hago click en la casilla "Same as Bill To"
    And Lleno las casillas de tarjeta
    |Credit Card| American Express  |
    |Card Number| 1234-123456-12345 |
    |Expiration	| 11/25             |
    And hago click en el boton "Place The Order"
    Then deberia mostrarme una alerta de invalidacion de "City"