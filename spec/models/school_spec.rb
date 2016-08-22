require 'spec_helper'

RSpec.describe School, type: :model do
  it { is_expected.to have_many :students }
end
