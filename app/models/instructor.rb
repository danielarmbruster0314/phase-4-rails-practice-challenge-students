class Instructor < ApplicationRecord
    has_many :students
    
    validates :name, pressence: true 
end
