Feature: Como usuario
    Quiero ver el detalle de un articulo
    disponible en la lista de articulos

Background:
    Given Estoy en el sitio de GMO online
    And hago click en el boton "Enter GMO Online"

Scenario: Ver un producto disponible
    When hago click en un producto "Padded Socks"
    Then observo el detalle del producto "Padded Socks"
