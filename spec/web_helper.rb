def fill_in_form
  visit '/'
  click_link 'Add a student'
  fill_in 'Name', with: 'Luca'
  fill_in 'Email', with: 'luca@gmail.com'
  select('CUNEF', from: 'student[school_ids][]')
end 
