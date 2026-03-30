class Theme < ApplicationRecord
  has_many :challenges, dependent: :restrict_with_exception

  validates :name, presence: true
end
