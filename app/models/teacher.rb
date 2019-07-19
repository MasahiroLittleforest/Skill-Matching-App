class Teacher < ApplicationRecord
  belongs_to :user

  has_many :skills, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :certifications, dependent: :destroy
  has_many :applikations
  has_many :applicants, through: :applikations
end
