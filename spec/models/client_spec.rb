require 'rails_helper'

RSpec.describe Client, type: :model do
  it { is_expected.to belong_to :student }
  it { is_expected.to belong_to :school }
end
