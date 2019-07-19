class StudentsPreference < ApplicationRecord
  belongs_to :student
  belongs_to :category
  belongs_to :skill
  belongs_to :prefecture
end
