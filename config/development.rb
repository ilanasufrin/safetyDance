SECRETS_FILE = 'config/application.yml'

if File.exists?(SECRETS_FILE)
  secrets = YAML.load(File.read(SECRETS_FILE))
  secrets.each do |key, val|
    ENV[key] = ERB.new(val).result
  end
end
