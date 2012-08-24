require 'digest/sha2'

class ApplicationController < ActionController::Base
  protect_from_forgery
  def authenticate
    authenticate_or_request_with_http_basic('Enter Password') do |u, p|
      salt = Settings.admin_password_salt
      sha512 = Settings.admin_password_sha512
      u == 'admin' && Digest::SHA512.hexdigest(salt + p) == sha512
    end
  end
  before_filter :authenticate
end
