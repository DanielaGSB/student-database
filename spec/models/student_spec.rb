require 'spec_helper'

RSpec.describe Student, type: :model do
  it { is_expected.to have_many :schools }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :email }

  before(:each) do
    @student = FactoryGirl.build(:student)
  end

  it 'is invalid without an email address' do
    student = @student
    student.email = nil
    expect(student).to_not be_valid
  end

  it 'is invalid without a name' do
    student = @student
    student.name = nil
    expect(student).to_not be_valid
  end

  it 'is not valid unless it has a unique email' do
    duplicate_student = @student.dup
    duplicate_student.email = @student.email
    @student.save
    expect(duplicate_student).to_not be_valid
  end
end
