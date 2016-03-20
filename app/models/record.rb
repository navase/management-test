class Record < ActiveRecord::Base
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :consumption_data, presence: true, numericality: true
  validates :branch_id, presence: true

  belongs_to :branch
end
