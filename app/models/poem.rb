class Poem < ActiveRecord::Base

    belongs_to :poet

    validates :title, presence: true
    validates :date, presence: true
    validates :content, presence: true, uniqueness: true
    validates_presence_of :poet 
end 