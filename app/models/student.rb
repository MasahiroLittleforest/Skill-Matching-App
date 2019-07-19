class Student < ApplicationRecord
  belongs_to :user

  has_many :applikations
  has_many :applied_teachers, through: :applikations
end
