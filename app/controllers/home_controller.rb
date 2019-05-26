class HomeController < ApplicationController
  
  def index
    #require 'net/http'
    #require 'json'

   #this is called an instance variable, instance variable allows us to create variable inside the action method and use them in that method
    @url = 'https://api.coinmarketcap.com/v1/ticker/'

    #next is to create uri (Uniform resource identifier) that holds this class and put in that url
    @uri = URI(@url)

    #saying go that website 
    @response = Net::HTTP.get(@uri)

    #and grabt the result, parse it with json, slack the results inside this @coins
    @coins = JSON.parse(@response)

    #our array
    @my_coins = ["BTC", "XDP", "ADA", "XLM", "STEEM"]


  end

  def about
  end

  def lookup
    require 'net/http'
    require 'json'

   @url = 'https://api.coinmarketcap.com/v1/ticker/'
   @uri = URI(@url)
   @response = Net::HTTP.get(@uri)
   @lookup_coin = JSON.parse(@response)


    @symbol = params[:sym]
    if @symbol  
      @symbol = @symbol.upcase
    end

    if @symbol == ""
      @symbol = "Hey you Forgot to Enter a Currency!"
    end

  end

end
