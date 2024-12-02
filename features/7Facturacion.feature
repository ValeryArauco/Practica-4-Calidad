Feature: Como Administrador
    quiero comprobar si el proceso de
    Facturacion es correcto en formato
    estadounidense

Background:
    Given Estoy en el sitio de GMO online
    And hago click en el boton "Enter GMO Online"
    When ingreso una "<cantidad valida>" en el campo "Order Quantity" para un "<item>"
    And hago click sobre el boton "Place An Order"
    Then hago click 