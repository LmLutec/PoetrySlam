require 'pry'
class PoetsController < ApplicationController

    get '/poets' do 
        @poets = Poet.all 
        erb:"/poets/index"
    end 


    post '/poets' do 
        
    end 



end 