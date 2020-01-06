class Poet < ActiveRecord::Base

    has_secure_password 
    has_many :poems 

    validates_uniqueness_of :poet_name
    validates_uniqueness_of :email 

end

