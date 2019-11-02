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
        @poets = Poet.all
        if params[:poet_name] != "" && params[:email] != "" && params[:city] != "" && params[:state] != "" && params[:age] != "" && params[:password] != ""
            @poet = Poet.create(poet_name: params[:poet_name], email: params[:email], city: params[:city], state: params[:state], age: params[:age], password: params[:password])
            session[:poet_id] = @poet.id
            redirect "/poets/#{@poet.id}"    
        else 
            redirect "/poets/new"
        end 
    end 

    get "/poets/login" do 
        erb:"/poets/login"
    end 
    
    post "/login" do 
        @poet = Poet.find_by(poet_name: params[:poet_name])
            if @poet && @poet.authenticate(params[:password])
                session[:poet_id] = @poet.id 
                erb:"/poets/home"
            end 
    end 

    get "/poets/:id" do 
        @poet = Poet.find_by(id: params[:id])
        erb:"/poets/show"
    end 



end    
    
