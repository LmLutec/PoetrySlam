require 'pry'

class PoemsController < ApplicationController

    get '/poems' do 
        if logged_in?
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
        erb:'poems/show'
    end 

    get '/poems/:id/edit' do
        if logged_in? && current_user.id == @poem.poet_id 
            @poem = Poem.find_by(id: params[:id]) 
            erb:'poems/edit'
        else 
            erb:"/poets/login"
        end 
    end 

    patch '/poems/:id' do 
        @poem = Poem.find_by(id: params[:id])
        if logged_in? && current_user.id == @poem.poet_id 
            @poem.title = params[:title]
            @poem.date = params[:date]
            @poem.content = params[:content]
            @poem.save
        else 
            erb:"/poets/home"
        end 
    end 

    delete '/poems/:id/delete' do 
            @poem = Poem.find_by(id: params[:id])
        if logged_in? && current_user.id == @poem.poet_id 
            @poet = current_user
            @poem.delete 
            session[:id] = @poet.id 
            erb:"/poets/home"
        end 
    end 

end 