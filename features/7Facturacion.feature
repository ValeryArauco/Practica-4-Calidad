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


Scenario Outline: Introduzco datos invalidos en las casillas
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
    |Expiration	| 11/25             |
    Given cambio el "<valor>" en la "<casilla>" de "<Bill o Ship>"
    And hago click en el boton "Place The Order"
    Then deberia mostrarme una alerta de invalidacion de la "<casilla>" 

    Examples:
    | Bill o Ship   | casilla      | valor  | 
    | Ship          | Zip          | 1      |
    | Ship          | Phone        | 324    |
    | Bill          | Card Number  | 1      |
    | Bill	        | Expiration   | dasda  |
    | Bill          | Name         | 1      |
    | Bill	        | City         | 2      |
    | Bill	        | State        | 3      |
    
    