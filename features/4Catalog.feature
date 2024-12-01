Feature: Catálogo
    Como un usuario de la pagina 
    quiero ver la lista de items ofertados en el catálogo
    para ordenar aquellos que me interesan.

‌Background: Acceso al catálogo
Given Estoy en el sitio de GMO Online

Scenario: Ver todos los items
    When hago click en "Enter GMO OnLine"
    Then veo la lista de items

    | Item Number | Item Name | Unit Price	| Order Quantity |
    | <numero> | <item> | <precio> | <cantidad> |

    Examples:
    | numero | item | precio | cantidad |
    | 1000 | 3 Person Dome Tent     | $ 299.99 | 0 |
    | 1001 | External Frame Backpack| $ 179.95 | 0 |
    | 1002 | Glacier Sun Glasses    | $ 67.99 | 0 |
    | 1003 | Padded Socks           | $ 19.99 | 0 |
    | 1004 | Hiking Boots           | $ 109.90 | 0 |
    | 1005 | Back Country Shorts    | $ 24.95 | 0 |

