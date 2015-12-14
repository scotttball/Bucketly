if Rails.env.development?

begin
  YAML.load(File.read('config/aws_secrets.yml')).each do |key, value|
      ENV[key] = value
    end
rescue
  raise "You need to add config/aws_secrets.yml"
end

end
