require 'pry'
class PoetsController < ApplicationController

    get '/poets' do 
        @poets = Poet.all 
        erb:"/poets/index"
    end 

    get "/poets/new" do
        erb:"/poets/new"
      end
    


    post '/poets' do 
        
    end 



end 