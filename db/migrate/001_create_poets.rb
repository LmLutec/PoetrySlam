class CreatePoets < ActiveRecord::Migration

    def change
        create_table :poets do |t|
            t.string :poet_name
            t.string :email
            t.string :city
            t.string :state
            t.integer :age
            t.string :password_digest 
        end
    end 

end 