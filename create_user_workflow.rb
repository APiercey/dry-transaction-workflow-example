require "dry/transaction"
require_relative "./actions/create_user_validation"
require_relative "./actions/user_existence_validation"
require_relative "./actions/build_user"
require_relative "./actions/save_model"

class CreateUserWorkflow
  include Dry::Transaction

  step :validate_input
  step :validate_user_existence
  map :build_user
  step :insert_user
  step :build_result

  private

  def validate_input(input) = validate_using(CreateUserValidation, input)

  def validate_user_existence(input) = validate_using(UserExistanceValidation, input)

  def build_user(input) = BuildUser.new.call(input)

  def insert_user(user)
    Success(SaveModel.new.call(user))
  rescue InvalidModel => e
    Failure(e.msg)
  end

  def build_result(user) = Success({ user_id: user.id })

  def merge_errors(errors) = errors.join(", ")

  def validate_using(validator, input)
    errors = validator.new.call(input)
    return Failure(merge_errors(errors)) if errors.any?

    Success(input)
  end
end
