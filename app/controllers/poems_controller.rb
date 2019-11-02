class PoemsController < ApplicationController

    get '/poems' do 
        erb:"/poems/index"
    end 

    get '/poems/new' do 
        erb:"poems/new"
    end 

    post '/poems' do 
        @poem = Poem.create(title: params[:title], date: params[:date], content: params[:content])
    end 

end 