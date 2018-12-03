class CommentPolicy
  attr_reader :user, :post

  def initialize(user, login)
    @user = user
    @login = login
  end

  def update?
    user == login
  end
end