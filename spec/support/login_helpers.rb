module LoginHelpers
  def login_as(user)
    post "/session", params: { session: { email: user.email, password: "password", admin: true } }
  end
end