require 'bundler'
ENV['RACK_ENV'] ||= "development"
Bundler.require(:default, ENV['RACK_ENV'])

require "./config/#{ENV['RACK_ENV']}"

def load_dirs(array)
  array.each do |dir|
    Dir.entries(dir).each do |file|
      next if file.start_with?('.') || file == 'application_controller.rb'
      require_relative "../#{dir}/#{file}"
    end
  end
end

require_relative "../app/controllers/application_controller.rb"

load_dirs ['app/models', 'app/controllers', 'lib']
