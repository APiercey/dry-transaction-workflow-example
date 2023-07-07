class CreateUserValidation
  def call(input)
    errors = []

    errors.push("Username missing") if input["username"].nil?
    errors.push("Password missing") if input["password"].nil?
    errors.push("Name missing") if input["name"].nil?
    errors.push("Age missing") if input["age"].nil?

    errors
  end
end
