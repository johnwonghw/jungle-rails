require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  before :each do
    @user = User.create! first_name: 'Bob', last_name: 'Builder', email: 'test@example.com', password: '1234567', password_confirmation: '1234567'
  end
  


  scenario "users can login successfully" do
    visit '/login'
    within 'form' do
      fill_in id: 'email', with: @user.email
      fill_in id: 'password', with: @user.password
      click_button 'Submit'
    end

    expect(page).to have_content(@user.first_name + " " + @user.last_name)
  end
end
