class HomeController < ApplicationController
def index
# We will be needing these two lines below to manipulate the third part data
  require 'net/http'
  require 'json'

@url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=cf06a54c-413a-4cd6-9576-4681d376a3c2&start=1&limit=5000&convert=USD'
  @uri = URI(@url)
  @response = Net::HTTP.get(@uri)
  @coins = JSON.parse(@response) 
  @my_coins = ["BTC"]
end

  def about 
  end 

  def lookup
    require 'net/http'
    require 'json'
    @url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=cf06a54c-413a-4cd6-9576-4681d376a3c2&start=1&limit=5000&convert=USD'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri) #this line gets the response from the web
    @lookup_coin = JSON.parse(@response) #this line parses it and converts to ruby


    @symbol = params[:sym]
    
      if @symbol
        @symbol = @symbol.upcase 
      end

    if @symbol == ""
      @symbol = "Hey You Forgot To Enter A Currency"
    end
  end 
end 
