require 'rubygems' # for ruby 1.8 compatibility

gem 'fog' # http://fog.io
require 'fog'

#Configuration YAML files are available in the config directory
#while testing script folder was set as working folder
curr_path = File.expand_path(File.dirname(__FILE__))
config_yaml_path = File.expand_path('../config',curr_path)

#Loading the YAML file
aws_config = YAML::load_file(File.join(config_yaml_path, '/aws_glacier.yml' ))

#Connecting to Glacier
glacier = Fog::AWS::Glacier.new({:aws_access_key_id => aws_config['AWS_ACCESS_KEY_ID'],
                                 :aws_secret_access_key => aws_config['AWS_SECRET_ACCESS_KEY']})

aws_vault = nil

#Retrieving all vaults information
vaults = glacier.vaults.all

vaults.each { |vault_itr|
                if (vault_itr.id.eql? 'albums' )
                  aws_vault = vault_itr
                end
                break if (!aws_vault.nil?)
            }

#while testing, was storing an archive of albums in 7z format
if (aws_vault.nil?)
  aws_vault = glacier.vaults.create :id => 'albums'
end
# print aws_vault.to_yaml


#Need to improve validation here. At this point expects the archive name as the first argument.
filename = ARGV[0]
filename = '../' + filename

#archive is expected to be in the project root and not inside the script folder
archive_path =  File.expand_path filename,curr_path

puts "Reading from archive_path" + archive_path
puts  "This may take a little while based on the size ..."
mem_buf = IO.read archive_path


puts  "About to transfer file to Vault ..."
aws_vault.archives.create :body => mem_buf, :multipart_chunk_size => 1024*1024
puts "File transferred to Vault"

#Mock before writing to vault
#IO.write('../Sample.7z',mem_buf)