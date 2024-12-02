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
    Given hago click en el boton "Proceed With Order"

Scenario: Confirmar compra con datos repetisdos en casilla "Bill To" y "Ship To" 
    When Lleno las casillas para factura en "Bill To"
    |Name       | Pepito             |
    |Address 	| Muyurina           |
    |City 	    | Cochabamba         |
    |State      | Cochabamba         | 	
    |Zip        | 9897               |
    |Phone   	| 1234-567-12        |
    |E-mail  	| pepe@pepazo.com    |
    And Lleno las casillas para factura en "Ship To"
    |Name       | Pepito             |
    |Address 	| Muyurina           |
    |City 	    | Cochabamba         |
    |State      | Cochabamba         | 	
    |Zip        | 9897               |
    |Phone   	| 1234-567-12        |
    And Selecciono el tipo de tarjeta "American Express"
    And Ingreso mi numero de tarjeta "1234-123456-12345"
    And Ingreo la fecha de expiracion de mi tarjeta "11/13"
    And hago click en el boton "Place The Order"
    Then Deberia mostrarme los datos de metodo de pago por tarjeta American Express
    And Deberia mostrarme los datos de Facturacion
    |Bill to                        ||Ship To                        |
    |Pepito                         ||Pepito                         |
    |Muyurina                       ||Muyurina                       |
    |Cochabamba, Cochabamba, 9897   ||Cochabamba, Cochabamba, 9897   |
