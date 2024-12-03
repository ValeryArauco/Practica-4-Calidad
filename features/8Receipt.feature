Feature: recibo
    Como usuario del sistema,
    quiero verificar que la pantalla de recibo de compra muestre los datos correctamente,
    para asegurarme de que el recibo sea claro y fácil de entender.

Background:
    Given Estoy en el sitio de GMO online
    And hago click en el boton "Enter GMO Online"
    And ingreso cantidades validas a ordenar para los items
    | item                     | cantidad |
    | Glacier Sun Glasses      | 1        |
    | Hiking Boots             | 2        |

    And hago click sobre el boton "Place An Order"
    And hago click sobre el boton "Proceed With Order"
    When Lleno las casillas para factura en "Bill To"
    |Name       | Pepito             |
    |Address 	| Muyurina           |
    |City 	    | Cochabamba         |
    |State      | Cochabamba         | 	
    |Zip        | 33125              |
    |Phone   	| 123-123-1234       |
    |E-mail  	| pepe@pepazo.com    |

    And Lleno las casillas de tarjeta
    |Credit Card| American Express  |
    |Card Number| 1234-123456-12345 |
    |Expiration	| 11/25 |

    And Hago click en la casilla "Same as Bill To"
    And hago click sobre el boton "Place The Order"

    
Scenario: Validar la información ingresada
    Then debería mostrarse que los datos de facturacion y envio coincidan con los ingresados
    |Name       | Pepito             |
    |Address 	| Muyurina           |
    |City 	    | Cochabamba         |
    |State      | Cochabamba         | 	
    |Zip        | 33125              |
    |Phone   	| 123-123-1234       |
    |Method     | AMEX               |

    And deberia mostrar los productos seleccionados
    | Qty | Product                  | Status        | Unit Price | Total Price |
    | 1   | Glacier Sun Glasses      | To Be Shipped | $ 67.99	  | $ 67.99	    |
    | 2   | Hiking Boots             | To Be Shipped | $ 109.90   | $ 219.80    |

    And los detalles de precios deberian ser
    | Product Total         | $ 287.79 |
    | Sales Tax             | $ 14.39  |
    | Shipping & Handling   | $ 5.00   |
    | Grand Total           | $ 307.18 |