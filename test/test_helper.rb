ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'



class ActiveSupport::TestCase
  include ActionDispatch::TestProcess

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  CarrierWave.root = Rails.root.join('test/fixtures/files')
  # Add more helper methods to be used by all tests here...
  def after_teardown
    super
    CarrierWave.clean_cached_files!(0)
  end
  
  def log_in(user, password)
    post user_session_path, params:  {:user => { :email => user.email, :password => password}}
  end
end
