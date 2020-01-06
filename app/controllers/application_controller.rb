require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do 
    erb:"/poets/new"
  end 

  helpers do 

    def current_user
      @poet = Poet.find_by(id:session["poet_id"]) 
    end 
  
    def logged_in?
      if current_user
        true 
      else
        false
      end 
    end 
  
  end

end
