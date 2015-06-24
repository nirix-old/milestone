module Helpers
  def login(username, password)
    visit login_path
    fill_in 'Username', with: username
    fill_in 'Password', with: password
    click_button 'Login'
  end

  def create_admin_and_login
    admin = create(:admin, password: "imonaboat")
    login admin.username, "imonaboat"
  end
end
