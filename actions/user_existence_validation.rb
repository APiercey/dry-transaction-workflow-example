require_relative "../user"

class UserExistanceValidation
  def call(input)
    errors = []

    errors.push("Username taken") if User.exists?(username: input["username"])

    errors
  end
end
