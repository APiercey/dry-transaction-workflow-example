require "pry"
require_relative "./setup"

require_relative "./create_user_workflow"

create_user_workflow = CreateUserWorkflow.new

args = {"username" => "Test", "password" => "Test", "name" => "Alexander", "age" => 23}

create_user_workflow.call(args) do |m|
  m.success do |result|
    puts "Created user with ID #{result[:user_id]}!"
  end

  m.failure do |errors|
    puts "Creating user failed: #{errors}"
  end
end
