Feature: Resetear el catalogo
    Como un usuario de la página
    quiero poder reiniciar mi orden de pedido
    para restablecer todas las cantidades de los productos seleccionados a cero.

Background:
    Given Estoy en el sitio de GMO online
    And hago click en el boton "Enter GMO Online"

Scenario: Resetear el formulario algunos campos llenados
  When ingreso las cantidades para los items
    | item                     | cantidad |
    | 3 Person Dome Tent       | 9        |
    | Glacier Sun Glasses      | 7        |
    | Hiking Boots             | 12       |
  When hago click sobre el botón "Reset Form"
  Then verifico que las cantidades se reinicien a cero para los items
    | item                     |
    | 3 Person Dome Tent       |
    | External Frame Backpack  |
    | Glacier Sun Glasses      |
    | Padded Socks             |
    | Hiking Boots             |
    | Back Country Shorts      |

Scenario: Resetear el formulario con todos los campos
  When ingreso las cantidades para los items
    | item                     | cantidad |
    | 3 Person Dome Tent       | 1        |
    | External Frame Backpack  | 2        |
    | Glacier Sun Glasses      | 3        |
    | Padded Socks             | 4        |
    | Hiking Boots             | 5        |
    | Back Country Shorts      | 6        |
  When hago click sobre el botón "Reset Form"
  Then verifico que las cantidades se reinicien a cero para los items
    | item                     |
    | 3 Person Dome Tent       |
    | External Frame Backpack  |
    | Glacier Sun Glasses      |
    | Padded Socks             |
    | Hiking Boots             |
    | Back Country Shorts      |