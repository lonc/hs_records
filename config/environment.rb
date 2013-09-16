# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
HomeSchool::Application.initialize!
Rails.logger = Logger.new("Debug_log")
