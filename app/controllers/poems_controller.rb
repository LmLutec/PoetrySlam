require 'pry'

class PoemsController < ApplicationController

    get '/poems' do 
        erb:'/poems/index'
    end 

    get '/poems/new' do 
        erb:'poems/new'
    end 

    post '/poems' do  
        @poem = Poem.create(title: params[:title], date: params[:date], content: params[:content])
        current_user.poems << @poem  
        redirect 'poems/#{@poem.id}'
    end 

    get 'poems/:id' do 
        @poem = Poem.find_by(content: params[:content])
        erb:'poems/show'
    end 

    get '/poems/:id/edit' do
        @poem = Poem.find_by(id: params[:id]) 
        erb:'poems/edit'
    end 

    patch '/poems/:id' do 
        @poem = Poem.find_by(id: params[:id])
        @poem.title = params[:title]
        @poem.date = params[:date]
        @poem.content = params[:content]
        @poem.save
    end 

    delete 'poems/:id/delete' do 
        @poem = Poem.find_by(id: params[:id])
        @poem.delete 
    end 

end 