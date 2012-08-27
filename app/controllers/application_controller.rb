require 'digest/sha2'
require 'json'

class ApplicationController < ActionController::Base
  protect_from_forgery
  @@settings = JSON.parse(File.read(Settings.configuration_path))
  def authenticate
    authenticate_or_request_with_http_basic('Enter Password') do |u, p|
      salt = @@settings['admin_password_salt']
      sha512 = @@settings['admin_password_hash']
      u == @@settings['admin_login'] && Digest::SHA512.hexdigest(salt + p) == sha512
    end
  end
  before_filter :authenticate
end
