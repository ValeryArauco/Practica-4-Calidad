require 'capybara/dsl'
class FacturationForm
    include Capybara::DSL
    def initialize()
    end
    
    def llenar_form_BillTo(informacion_hash)
        find('input[name="billName"]').set(informacion_hash["Name"])
        find('input[name="billAddress"]').set(informacion_hash["Address"])
        find('input[name="billCity"]').set(informacion_hash["City"])
        find('input[name="billState"]').set(informacion_hash["State"])
        find('input[name="billZipCode"]').set(informacion_hash["Zip"])
        find('input[name="billPhone"]').set(informacion_hash["Phone"])
        find('input[name="billEmail"]').set(informacion_hash["E-mail"])
    end

    def llenar_form_ShipTo(informacion_hash)
        find('input[name="shipName"]').set(informacion_hash["Name"])
        find('input[name="shipAddress"]').set(informacion_hash["Address"])
        find('input[name="shipCity"]').set(informacion_hash["City"])
        find('input[name="shipState"]').set(informacion_hash["State"])
        find('input[name="shipZipCode"]').set(informacion_hash["Zip"])
        find('input[name="shipPhone"]').set(informacion_hash["Phone"])
    end

    def llenar_form(tipo, informacion_hash)
        if(tipo == "Bill To")
            llenar_form_BillTo(informacion_hash)
        elsif(tipo == "Ship To")
            llenar_form_ShipTo(informacion_hash)
        end
    end
end