require 'aws-sdk'
require 'yaml'

# helper method to print pageable data received as response
def print_response(pageable)
	pageable.each do |response|
		print response.data
	end
end

AWS_REGION = 'us-east-1'
VAULT_NAME = 'albums'

#Configuration YAML files are available in the config directory
#while testing script folder was set as working folder
curr_path = File.expand_path(File.dirname(__FILE__))
config_yaml_path = File.expand_path('../config',curr_path)

#Loading the YAML file
aws_config = YAML::load_file(File.join(config_yaml_path, '/aws_glacier.yml' ))

glacier = Aws::Glacier::Client.new(	access_key_id: aws_config['AWS_ACCESS_KEY_ID'], 
									secret_access_key: aws_config['AWS_SECRET_ACCESS_KEY'],
									region: AWS_REGION )

aws_vault = Aws::Glacier::Vault.new(client: glacier, name: VAULT_NAME,  account_id: '-')
pageable = glacier.delete_archive( account_id: '-',
							   vault_name: VAULT_NAME,
							   archive_id: aws_config['ARCHIVE_ID'])
print_response pageable


