Feature: 
    Como un usuario de la pagina 
    quiero hacer conocer que me gusto la pagina
    para poder comunicarse via email con el encargado del sitio

Background:
    Given Estoy en el sitio de GMO online

Scenario: Enlace de correo es válido
    When hago click en el enlace "Please let us know how you like our site."
    Then la dirección de correo proporcionada debe ser válida

Scenario: Enlace de correo es de gmo
    When hago click en el enlace "Please let us know how you like our site."
    Then el enlace me redirige a un correo "mailto:gmo-master@segue.com"
