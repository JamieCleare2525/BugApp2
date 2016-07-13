class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
    root 'application#hello'
  end
end
