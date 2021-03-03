# set up like a class
# responsible for talking with our API

class API

    def self.start
        puts "What drink would you like today?"
        input = gets.strip
        url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{input}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        hash = JSON.parse(response)
        array_of_drinks = hash["drinks"]
        array_of_drinks.each do |drink|
            Drink.new(drink["iddrink"], drink["srtDrink"], drink["strCategory"], drink["strInstructions"])
        end
    end
end
