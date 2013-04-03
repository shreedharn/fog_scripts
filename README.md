The Repository contains a set of ruby sample scripts for accessing various Amazon Web Services (aws)
<p>
<b>aws_glacier.rb:</b>
<br>
Makes a connection to Vault and uploads a file to the cloud. Provide the file name as
a first argument to the script.
</p>

You have to create a configuration file in the config directory with required aws configuration information.
For aws\_glacier.rb following configuration information is required in the aws\_glacier.yml
<br>
<br>
&#35; config/aws_glacier.yml
<br>
AWS_ACCESS_KEY_ID &nbsp; : &nbsp; [] &nbsp; &#35; mention your access id without square brackets
<br>
AWS_SECRET_ACCESS_KEY &nbsp; : &nbsp; [] &nbsp; &#35; mention your secret access key without square brackets

<p>
<b>aws_s3.rb:</b>
<br>
Use aws-sdk to upload a image file to a S3 bucket. The script uses bucket's lifecycle configuration to provide the Object
expiration date.
<br>
aws configuration information is provided in the aws_glacier.yml
</p>