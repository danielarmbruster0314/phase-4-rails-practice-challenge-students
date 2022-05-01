class Student < ApplicationRecord
  belongs_to :instructor

  validates :name, pressence: true 
  validates :age, comparison: { greater_than: 18}
  validates :instructor_id, pressence: true 
end
