require 'rubygems' # for ruby 1.8 compatibility

gem 'fog' # http://fog.io
require 'fog'

#identify path broken into steps for better readability
curr_path = File.expand_path(File.dirname(__FILE__))
config_yaml_path = File.expand_path('../config',curr_path)


aws_config = YAML::load_file(File.join(config_yaml_path, '/aws_glacier.yml' ))


glacier = Fog::AWS::Glacier.new({:aws_access_key_id => aws_config['AWS_ACCESS_KEY_ID'],
                                 :aws_secret_access_key => aws_config['AWS_SECRET_ACCESS_KEY']})
#list = glacier.list_vaults
#list.body["VaultList"][0]["VaultARN"]
aws_vault = nil
vaults = glacier.vaults.all

vaults.each { |vault_itr|
                if (vault_itr.id.eql? 'albums' )
                  aws_vault = vault_itr
                end
                break if (!aws_vault.nil?)
            }

if (aws_vault.nil?)
  aws_vault = glacier.vaults.create :id => 'albums'
end

print aws_vault.to_yaml

