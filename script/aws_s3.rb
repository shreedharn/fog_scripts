require 'rubygems' # for ruby 1.8 compatibility
gem 'aws-sdk' # http://aws.amazon.com/sdkforruby/
require 'aws'


#Configuration YAML files are available in the config directory
#while testing script folder was set as working folder
curr_path = File.expand_path(File.dirname(__FILE__))
config_yaml_path = File.expand_path('../config',curr_path)

#Loading the YAML file
aws_config = YAML::load_file(File.join(config_yaml_path, '/aws_glacier.yml' ))


AWS.config({
               :access_key_id => aws_config['AWS_ACCESS_KEY_ID'],
               :secret_access_key => aws_config['AWS_SECRET_ACCESS_KEY'],
               :max_retries => 2,
           })

s3 = AWS::S3.new
bucket = s3.buckets['fogify'] # makes no request
print bucket.exists? #=> returns true/false
obj = AWS::S3::S3Object.new(bucket,'my-picture.jpg') # no request made




f = File.open('../my_pic.jpg','rb')
obj.write(f, :multipart_threshold => 2 * 1024 * 1024)
f.close

#remove the content in 2 days. Testing life cycle configuration method
bucket.lifecycle_configuration.update do
  add_rule('my-picture.jpg', :expiration_time => 2)
end
