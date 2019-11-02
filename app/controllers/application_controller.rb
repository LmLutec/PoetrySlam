require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end


  helpers do 

    def self.current_user
      @user = Poet.find_by(id:session["user_id"]) 
    end 
  
    def self.logged_in?
      if current_user
        true 
      else
        false
      end 
    end 
  
  end

end
