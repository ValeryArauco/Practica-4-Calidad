Feature: 
Como un usuario de la pagina quiero acceder a la informacion
sobre como fue hecha la pagina, asi conozco las tecnologias usadas
‌
Background:
    Given Estoy en el sitio de GMO online

Scenario: Ver la informacion del sitio
    When hago click en "About the GMO Site"
    Then observo la lista de las tecnologias usadas en el sitio:
        | HTML 3.2 |
        | HTML Browser Extensions |
        | Animation |
        | JavaScript |
        | CGI |
        | Java |
        | ActiveX |
        | Client-side processes |
        | Server-side processes |

Scenario: Ver la informacion de tecnologias futuras
    When hago click en "About the GMO Site"
    Then observo la lista de las tecnologias a incorporar en el sitio a futuro: 
      | Style sheets                 |
      | Multimedia                   |
      | VBscript                     |
      | Plug-Ins                     |
      | IIOP                         |
      | Cookies                      |
      | Secure transactions          |
      | Database access              |