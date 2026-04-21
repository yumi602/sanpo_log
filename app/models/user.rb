class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :walk_records, dependent: :destroy
  has_many :challenges, dependent: :destroy
  has_many :weekly_reflections, dependent: :destroy
end
