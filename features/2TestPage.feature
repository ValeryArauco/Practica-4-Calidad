Feature: 
Como un usuario de la pagina quiero acceder al apartado de prueba
para conocer las caracteristicas de los navegadores

‌
Scenario: Ver las caracteristicas de Internet Explorer
    Given Estoy en el sitio de GMO online 
    When hago click en "Browser Test Page"
    Then observo la informacion correspondiente a Internet Explorer:
        |Blinking Text|
        |dot bullets|
        |circle bullets|
        |square bullets|

Scenario: Ver las caracteristicas de Netscape Navigator
    Given Estoy en el sitio de GMO online 
    When hago click en "Browser Test Page"
    Then observo la informacion correspondiente a Netscape Navigator:
        |Colored Horizontal Rules|
        |Definition Text Style\n(should be an italic font)|
        |Trademarks are important™|
        |Table Properties|

Scenario: Ver el contenido al acceder a la página de Java Applet
    Given Estoy en el sitio de GMO online
    When hago click en "Browser Test Page"
    And ingreso al enlace de "Java Applet"
    Then observo que el contenido de la página es "Sample Java Applet"


Scenario: Ver el contenido al acceder a la página de ActiveX
    Given Estoy en el sitio de GMO online
    When hago click en "Browser Test Page"
    And ingreso al enlace de "ActiveX"
    Then observo el contenido esperado de la tabla ActiveX:
        | ActiveX TextField |
        | ActiveX ComboBox  |
        | ActiveX CheckBox  |
        | ActiveX Button    |