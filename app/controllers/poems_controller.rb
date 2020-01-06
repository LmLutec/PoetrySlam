require 'pry'

class PoemsController < ApplicationController

    get '/poems' do 
        if logged_in?
            @poems = Poem.all
            @poets = Poet.find_by(id: params[:id])
            erb:'/poems/index'
        else 
            erb:"/poets/login"
        end 
    end 

    get '/poems/new' do 
        if logged_in?
            erb:'/poems/new'  
        else 
            erb:"/poets/new"
        end 
    end 

    post '/poems' do 
        if logged_in?
            @poem = Poem.create(title: params[:title], date: params[:date], content: params[:content])
            current_user.id = @poem.poet_id 
            current_user.poems << @poem  
            redirect to "poems/#{@poem.id}" 
        else 
            erb:"/poets/new"
        end 
    end 

    get '/poems/:id' do 
        @poem = Poem.find_by(id: params[:id])
        @poet = current_user 
        erb:'poems/show'
    end 

    get '/poems/:id/edit' do
        @poem = Poem.find_by(id: params[:id]) 
        if logged_in? && current_user.id == @poem.poet_id 
            erb:'poems/edit'
        else 
            erb:"/poets/login"
        end 
    end 

    patch '/poems/:id' do 

        @poet = current_user
        @poem = Poem.find_by(id: params[:id])
    
            @poem.update(:title => params[:title])
            @poem.update(:date => params[:date])
            @poem.update(:content => params[:content])
            @poem.save
         
            erb:"/poets/home"
         
    end 

    delete '/poems/:id/delete' do 
            @poet = current_user
            @poem = Poem.find_by(id: params[:id])
            @poem.delete 
            #session[:id] = @poet.id 
            erb:"/poets/home"
    end 

end 
