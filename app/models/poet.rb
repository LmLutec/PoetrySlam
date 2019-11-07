class Poet < ActiveRecord::Base

    has_secure_password 
    has_many :poems 

    validates :poet_name, uniqueness: { case_sensitive: false }
    
end

