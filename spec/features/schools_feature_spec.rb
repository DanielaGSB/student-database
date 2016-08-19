require 'rails_helper'

feature 'schools' do
  context 'viewing schools'
    let!(:makers){ School.create(name:'makers') }
    let!(:academy){ School.create(name:'academy') }

  scenario 'lets a user view a school' do
   visit '/schools'
   click_link 'makers'
   expect(page).to have_content 'makers'
   expect(current_path).to eq "/schools/#{makers.id}"
  end

end
