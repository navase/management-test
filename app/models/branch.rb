class Branch < ActiveRecord::Base
  validates :name, presence: true

  has_many :registrations, dependent: :destroy
end
