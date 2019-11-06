require 'pry'
class PoetsController < ApplicationController

    get '/poets' do 
        @poets = Poet.all 
        erb:"/poets/index"
    end 

    get '/poets/new' do 
        erb:"/poets/new"
    end

    post '/poets' do 
        @poet = Poet.create(poet_name: params[:poet_name], email: params[:email], city: params[:city], state: params[:state], age: params[:age], password: params[:password])
        session[:poet_id] = @poet.id
        erb:"/poets/home"    
    end 

    get '/poets/login' do 
        erb:"/poets/login"
    end 
    
    post '/login' do 
        if !logged_in?
            @poet = Poet.find_by(poet_name: params[:poet_name])
            if @poet && @poet.authenticate(params[:password])
                session[:poet_id] = @poet.id 
                erb:"/poets/home"
            end 
        
        else 
            erb:"/poets/home"
        end 
    end 

    post '/logout' do 
        if logged_in?
            session.clear
            redirect to "/poets/login"
        end     
    end 


    get '/poets/:id' do 
        @poet = Poet.find_by(id: params[:id])
        erb:"/poets/show"
    end 

    get '/poets/:id/edit' do
        @poet = Poet.find_by(id: params[:id])
        erb:"/poets/edit"
    end

    patch '/poets/:id' do 
        @poet = Poet.find_by(id: params[:id])
        @poet.poet_name = params[:poet_name]
        @poet.city = params[:city]
        @poet.state = params[:state]
        @poet.age = params[:age]
        @poet.email = params[:email]
        @poet.password = params[:password]
        @poet.save 
    end 

    delete '/poets/:id/delete' do 
        @poet = current_user
        @poet.delete
        erb:"/poets/new"
    end 


end    
    
