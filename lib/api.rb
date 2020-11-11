class API
    
    def self.start

        url = " "
        uri = URI(url)
        response = Net::HTTP.get(uri)
        hash = JSON.parse(response)

    end 

end 