require 'rails_helper'

feature 'students' do
  context 'no students have been added' do
    scenario 'should display a prompt to add a student' do
      visit '/'
      expect(page).to have_content 'No students to show'
      expect(page).to have_link 'Add a student'
    end
  end

  context 'students have been added' do
    before do
      Student.create(name: 'Luca', email: 'luca@gmail.com')
    end
    scenario 'display students' do
      visit '/'
      expect(page).to have_content 'Luca'
      expect(page).not_to have_content 'No students to show'
    end
  end
end
