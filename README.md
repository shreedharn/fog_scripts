The Repository contains a set of ruby sample scripts for accessing various Amazon Web Services (aws)

aws_glacier.rb:
Makes a connection to Vault and uploads a file to the cloud.
Note that the amazon configuration information are maintained in aws_glacier.yml file.

<br>
You have to create a configuration files in the config directory with required configuration information
# config/aws_glacier.yml
AWS_ACCESS_KEY_ID : [] # mention your access id without square brackets
AWS_SECRET_ACCESS_KEY : [] #mention your secret access key without square brackets
<br>
