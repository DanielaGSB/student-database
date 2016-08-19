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
      Student.create(name: 'Luca', email: 'luca@gmail.com', school: 'CUNEF')
    end
    scenario 'display students' do
      visit '/'
      expect(page).to have_content 'Luca'
      expect(page).not_to have_content 'No students to show'
    end
  end

  context 'adding a new student' do
    scenario 'prompts user to fill out a form on a student, then display students' do
      visit '/'
      click_link 'Add a student'
      fill_in 'Name', with: 'Luca'
      fill_in 'Email', with: 'luca@gmail.com'
      select 'CUNEF', from: 'Schools'
      click_button 'Create Student'
      expect(page).to have_content 'Luca'
      expect(current_path).to eq '/'
    end
  end
end
