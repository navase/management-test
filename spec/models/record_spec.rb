require 'rails_helper'

RSpec.describe Record, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:start_date) }
    it { is_expected.to validate_presence_of(:end_date) }
    it { is_expected.to validate_presence_of(:consumption_data) }
    it { is_expected.to validate_numericality_of(:consumption_data) }
    it { is_expected.to validate_presence_of(:branch_id) }
    it { is_expected.to belong_to(:branch) }
  end
end
