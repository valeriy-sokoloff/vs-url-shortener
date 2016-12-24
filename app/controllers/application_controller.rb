class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action { @hasher = Hasher.new }

  rescue_from ActionController::ParameterMissing do
    head 400
  end
end
