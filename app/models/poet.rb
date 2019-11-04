class Poet < ActiveRecord::Base
    has_secure_password 
    has_many :poems 

    validates :poet_name, presence: true, uniqueness: true
    validates :city, presence: true
    validates :state, presence: true
    validates :age, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
end

