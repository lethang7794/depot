module AuthorizeHelper
  def login_as(user)
    post '/login', params: { name: user.name, password: 'secret' }
  end

  def logout
    delete 'logout'
  end

  def login_as_user(user)
    visit '/login'
    fill_in 'name', with: user.name
    fill_in 'password', with: 'secret'
    click_on 'commit'
  end
end
