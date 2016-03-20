class Branch < ActiveRecord::Base
  validates :name, presence: true

  has_many :records, dependent: :destroy
end
