The Repository contains a set of ruby sample scripts for accessing various Amazon Web Services (aws)
<p>
<b>aws_s3.rb:</b>
<br>
Uses aws-sdk to upload a image file to a S3 bucket. The script uses bucket's lifecycle configuration to provide the Object
expiration date.
</p>

<p>
<b>glacier_fogio.rb</b>
<br>
Uses fog gem to upload a file as an archive to a AWS Glacier Vault. Provide the file name as
a first argument to the script. Script expects archive name as its first argument
</p>

<p>
<b>glacier_aws_sdk.rb</b>
<br>
Uses aws sdk to delete an archive from AWS Glacier Vault. Provide the file name as
a first argument to the script. Script expects archive name as its first argument
</p>

<p>
<b>aws_glacier.yml</b>
<br>
aws_glacier.yml is a required configuration files to use the above scripts.
<br>
Copy sampleconfig.yml as aws_glacier.yml in the config directory and replace with valid values. For using the scripts, the IAM user should have AmazonS3FullAccess and AmazonGlacierFullAccess policy.
</p>