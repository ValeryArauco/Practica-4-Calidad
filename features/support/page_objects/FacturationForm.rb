require 'capybara/dsl'
class FacturationForm
    include Capybara::DSL

    attr_accessor :billName, :billAddress,
    :billCity,
    :billState,
    :billZipCode,
    :billPhone,
    :billEmail,
    :CardType,
    :CardNumber,
    :CardDate,
    :shipName,
    :shipAddress,
    :shipCity,
    :shipState,
    :shipZipCode,
    :shipPhone

    def initialize()
        @billName = find('input[name="billName"]')
        @billAddress = find('input[name="billAddress"]')
        @billCity = find('input[name="billCity"]')
        @billState = find('input[name="billState"]')
        @billZipCode = find('input[name="billZipCode"]')
        @billPhone = find('input[name="billPhone"]')
        @billEmail = find('input[name="billEmail"]')
        @CardType = find("[name='CardType']")
        @CardNumber = find('input[name="CardNumber"]')
        @CardDate = find('input[name="CardDate"]')
        @shipName = find('input[name="shipName"]')
        @shipAddress = find('input[name="shipAddress"]')
        @shipCity = find('input[name="shipCity"]')
        @shipState = find('input[name="shipState"]')
        @shipZipCode = find('input[name="shipZipCode"]')
        @shipPhone = find('input[name="shipPhone"]')
        @errores = {"Phone" => "phone number", 
        "Zip" => "zip code", 
        "Card Number" => "card number of the form '1234-123456-12345'",
        "Expiration" => "date of the form 'MM/YY'"}
    end
    
    def llenar_form_BillTo(informacion_hash)
        @billName.set(informacion_hash["Name"])
        @billAddress.set(informacion_hash["Address"])
        @billCity.set(informacion_hash["City"])
        @billState.set(informacion_hash["State"])
        @billZipCode.set(informacion_hash["Zip"])
        @billPhone.set(informacion_hash["Phone"])
        @billEmail.set(informacion_hash["E-mail"])
    end

    def llenar_form_ShipTo(informacion_hash)
        @shipName.set(informacion_hash["Name"])
        @shipAddress.set(informacion_hash["Address"])
        @shipCity.set(informacion_hash["City"])
        @shipState.set(informacion_hash["State"])
        @shipZipCode.set(informacion_hash["Zip"])
        @shipPhone.set(informacion_hash["Phone"])
    end

    def llenar_form(tipo, informacion_hash)
        if(tipo == "Bill To")
            llenar_form_BillTo(informacion_hash)
        elsif(tipo == "Ship To")
            llenar_form_ShipTo(informacion_hash)
        end
    end

    def llenar_form_tarjeta(informacion_hash)
        tarjetas ={ 
            "American Express" => "AMEX",
            "MasterCard" => "MasterCard",
            "Visa" => "Visa"
        }
        @CardType.find("option[value='#{tarjetas[informacion_hash["Credit Card"]]}']").select_option
        @CardNumber.set(informacion_hash["Card Number"])
        @CardDate.set(informacion_hash["Expiration"])
    end

    def click_button_SameAsBillTo()
        check('shipSameAsBill')
    end

    def cambio_Valor_Casilla(tipo,casilla,valor)
        ubiCasillas = {
        "Bill" => {
            "Name" => @billName,
            "Address" => @billAddress,
            "City" => @billCity,
            "State" => @billState,
            "Zip" => @billZipCode,
            "Phone" => @billPhone,
            "E-mail" => @billEmail,
            "Card Number" => @CardNumber,
            "Expiration" => @CardDate
        },               
        "Ship" => {
            "Name" => @shipName,               
            "Address" => @shipAddress,             
            "City" => @shipCity,                
            "State" => @shipState,               
            "Zip" => @shipZipCode,
            "Phone" => @shipPhone,
        }
    }
    ubiCasillas[tipo][casilla].set(valor)
    end

    def msj_error(casilla)
        if(!@errores.has_key?(casilla))
            message = "please enter only letters"
        else
            message = "Please enter a valid " + @errores[casilla] + " in this field."
        end
        message
    end
end