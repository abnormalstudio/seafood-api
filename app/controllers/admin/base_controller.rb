class Admin::BaseController < ApplicationController
  http_basic_authenticate_with name: ENV.fetch('ADMIN_USERNAME','admin'), password: ENV.fetch('ADMIN_PASSWORD','password')
  skip_before_action :verify_authenticity_token
  layout "admin"
end