ENV['RACK_ENV'] ||= 'development'
ENV['APP_ROOT'] = File.dirname(__FILE__)

require './config/environment'

def mount_controllers_as_middleware
  Dir.entries('app/controllers').each do |file|
    next if file.start_with?('.') || file == "application_controller.rb"
    controller_name = file.split("_controller").first.capitalize
    use Kernel.const_get("#{controller_name}Controller")
  end
end

mount_controllers_as_middleware

run ApplicationController
