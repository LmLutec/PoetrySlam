class CreatePoems < ActiveRecord::Migration

    def change 
        create_table :poems do |t|
            t.string :title
            t.string :content
            t.date :date 
            t.integer :poet_id
        end 
    end 






end 