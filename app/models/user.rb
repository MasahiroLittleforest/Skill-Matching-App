# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }

  has_one :student, dependent: :destroy
  has_one :teacher, dependent: :destroy

  has_many :user_relationships, dependent: :destroy
  has_many :followings, through: :user_relationships, source: :follow, dependent: :destroy
  has_many :reverses_of_user_relationship, class_name: 'UserRelationship', foreign_key: 'follow_id', dependent: :destroy
  has_many :followers, through: :reverses_of_user_relationship, source: :user, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :certifications, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable,
         :omniauthable, omniauth_providers: %i[facebook twitter google_oauth2]

  mount_uploader :image, ImageUploader

  enum gender: {
    unanswered: 0,
    male: 1,
    female: 2,
    other: 3
  }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def full_name
    [first_name, middle_name, last_name].join(' ')
  end

  def age
    date_format = '%Y%m%d'
    (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10_000
  end

  def follow(other_user)
    unless self == other_user
      user_relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    user_relationship = user_relationships.find_by(follow_id: other_user.id)
    user_relationship&.destroy
  end

  def following?(other_user)
    followings.include?(other_user)
  end

  def activate_teacher_account
    teachers.find_or_create_by(user_id: id)
  end
end
