require 'yaml'

def read_config
	conf = YAML.load_file("test/config/config.yaml")
	conf.each{|k,v| instance_variable_set("@#{k}", v)}
end

def get_date
	return Time.now.strftime("%m%d%Y")
end