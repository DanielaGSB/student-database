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
    before { Student.create name: 'Luca', email: 'Luca@gmail.com' }
    before { Student.create name: 'Carlo', email: 'Carlo@gmail.com' }

    scenario 'display students' do
      visit '/'
      expect(page).to have_content 'Luca'
      expect(page).to have_content 'Carlo'
      expect(page).not_to have_content 'No students to show'
    end

    scenario 'removes a student' do
      visit '/'
      click_link 'Delete Luca'
      expect(page).to have_content 'Student deleted successfully'
      expect(page).not_to have_content 'Luca'
    end

    scenario 'edits a student' do
      visit '/'
      click_link 'Edit Luca'
      fill_in 'Email', with: 'lucagaleote@gmail.com'
      click_button 'Update Student'
      expect(page).to have_content 'lucagaleote@gmail.com'
      expect(page).not_to have_content 'Luca@gmail.com'
    end
  end

  context 'adding a new student' do
    before { School.create name: 'CUNEF' }
    before { School.create name: 'ICADE' }

    scenario 'prompts user to fill out a form on a student, then display students' do
      visit '/'
      click_link 'Add a student'
      fill_in 'Name', with: 'Luca'
      fill_in 'Email', with: 'luca@gmail.com'
      select('CUNEF', from: 'student[school_ids][]')
      click_button 'Create Student'
      expect(page).to have_content 'Luca'
      expect(page).to have_content 'CUNEF'
      expect(page). not_to have_content 'ICADE'
      expect(current_path).to eq '/'
    end

    scenario 'a user can link several schools to a student' do
      visit '/'
      click_link 'Add a student'
      fill_in 'Name', with: 'Luca'
      fill_in 'Email', with: 'luca@gmail.com'
      select('CUNEF', from: 'student[school_ids][]')
      select('ICADE', from: 'student[school_ids][]')
      click_button 'Create Student'
      expect(page).to have_content 'CUNEF'
      expect(page).to have_content 'ICADE'
      expect(current_path).to eq '/'
    end
  end

end
