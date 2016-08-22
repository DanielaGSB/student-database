require 'rails_helper'

feature 'schools' do
  context 'viewing schools'
  scenario 'lets a user view a school' do
    FactoryGirl.create(:school)
    FactoryGirl.create(:school, name: 'makers')
    visit '/schools'
    expect(page).to have_content 'makers'
    expect(page).to have_content 'CUNEF'
  end

  scenario 'lets a user view a school' do
    school = FactoryGirl.create(:school, name: 'makers')
    visit '/schools'
    click_link 'makers'
    expect(page).to have_content 'makers Students'
    expect(current_path).to eq school_path(school)
  end

end
