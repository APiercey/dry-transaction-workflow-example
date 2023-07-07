require "active_record"

ActiveRecord::Base.logger = Logger.new(STDERR)

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database  => ":memory:"
)

ActiveRecord::Schema.define do
  create_table :users do |table|
    table.column :username, :string
    table.column :password, :string
    table.column :name, :string
    table.column :age, :integer
  end
end
