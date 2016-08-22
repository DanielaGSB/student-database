require 'rails_helper'

feature 'students' do
  context 'no students have been added' do
    scenario 'should display a prompt to add a student' do
      visit '/'
      expect(page).to have_content 'No students to show'
      expect(page).to have_link 'Add a student'
    end
    scenario 'should display a link to view schoolst' do
      visit '/'
      expect(page).to have_link 'View schools'
    end
  end

  context 'students have been added' do
    before :each do
      FactoryGirl.create(:student)
      FactoryGirl.create(:student, name: 'Carlo', email: 'carlo@example.com')
    end
    scenario 'display students' do
      visit '/'
      expect(page).to have_content 'luca@example.com'
      expect(page).to have_content 'carlo@example.com'
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
      fill_in 'Email', with: 'lucagaleote@example.com'
      click_button 'Update Student'
      expect(page).to have_content 'lucagaleote@example.com'
      expect(page).not_to have_content 'luca@example.com'
    end
  end

  context 'adding a new student' do
    before :each do
      FactoryGirl.create(:school)
      FactoryGirl.create(:school, name: 'ICADE')
    end
    scenario 'prompts user to fill out a form on a student, then display students' do
      fill_in_form
      click_button 'Create Student'
      expect(page).to have_content 'Luca'
      expect(page).to have_content 'CUNEF'
      expect(page). not_to have_content 'ICADE'
      expect(current_path).to eq '/'
    end

    scenario 'a user can link several schools to a student' do
      fill_in_form
      select('ICADE', from: 'student[school_ids][]')
      click_button 'Create Student'
      expect(page).to have_content 'CUNEF'
      expect(page).to have_content 'ICADE'
      expect(current_path).to eq '/'
    end
  end

end
