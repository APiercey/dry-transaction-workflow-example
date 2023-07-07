class SaveModel
  class InvalidModel < StandardError ; end

  def call(object)
    object.save!
    object
  rescue ActiveRecord::RecordInvalid => e
    fail InvalidModel, e.to_s
  end
end
