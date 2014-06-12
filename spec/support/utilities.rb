module RequestHelpers
  def sign_in(user)
    visit new_user_session_path
    fill_in :user_email,    with: user.email
    fill_in :user_password, with: user.password
    click_button "Login"
    expect(page.current_path).to eq(root_path)
  end

  alias :login :sign_in
end
