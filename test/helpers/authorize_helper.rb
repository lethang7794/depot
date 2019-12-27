module AuthorizeHelper
  def login_as(user)
    post '/login', params: { name: user.name, password: 'secret' }
  end

  def logout
    delete 'logout'
  end
end
