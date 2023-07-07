require_relative "../user"

class BuildUser
  def call(input)
    User.new(input)
  end
end
