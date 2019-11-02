require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    erb:"/poets/new"
  end


  helpers do 

    def current_user
      if session[:user_id]
        true 
      else
        false
      end 
    end 
  
    def logged_in?
      if current_user
        true 
      end 
    end 
  
  end

end
