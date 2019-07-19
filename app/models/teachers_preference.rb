class TeachersPreference < ApplicationRecord
  belongs_to :teacher
  belongs_to :prefecture
end
