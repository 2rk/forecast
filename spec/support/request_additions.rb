# additional methods for request specs
module RequestAdditions
  # thanks to @see: http://stackoverflow.com/questions/12265174/select-an-option-by-value-not-text-in-capybara
  def select_by_value(id, value)
    option_xpath = "//*[@id='#{id}']/option[@value='#{value}']"
    option = find(:xpath, option_xpath).text
    select(option, :from => id)
  end

  # log in the user
  def login user, password = "secret"
    visit '/'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'secret'
    click_button 'Login'

    expect(page.current_path).to eq('/')
  end

  # log out
  def logout
    click_link "Logout"
  end
end
