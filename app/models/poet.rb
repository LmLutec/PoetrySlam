class Poet < ActiveRecord::Base
    has_secure_password 
    has_many :poems 

    
end

