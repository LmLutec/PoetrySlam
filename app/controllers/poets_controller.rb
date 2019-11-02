require 'pry'
class PoetsController < ApplicationController

    
    get "/poets/new" do
        erb:"/poets/new"
      end
    
    post '/poets' do 
        if params[:poet_name] != "" && params[:email] != "" && params[:city] != "" && params[:state] != "" && params[:age] != "" && params[:password] != ""
            @poet = Poet.create(poet_name: params[:poet_name], email: params[:email], city: params[:city], state: params[:state], age: params[:age], password: params[:password])
            erb:"/poets/#{@poet.id}"
        else 
            redirect to "/poets/new"
        end 
    end 

    get '/poets/:id' do 
        @poet = Poet.find_by(id: params[:id])
        erb:"/poets/show"
    end 

    get '/poets' do 
        @poets = Poet.all 
        erb:"/poets/index"
    end 

end 
