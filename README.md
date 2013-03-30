The Repository contains a set of ruby sample scripts for accessing various Amazon Web Services (aws)
<p>
<b>aws_glacier.rb:</b>
<br>
Makes a connection to Vault and uploads a file to the cloud.
Note that the amazon configuration information are maintained in aws_glacier.yml file.
</p>

You have to create a configuration files in the config directory with required aws configuration information. Here is
an example:
<br>
<br>
&#35; config/aws_glacier.yml
<br>
AWS_ACCESS_KEY_ID &nbsp; : &nbsp; [] &nbsp; &#35; mention your access id without square brackets
<br>
AWS_SECRET_ACCESS_KEY &nbsp; : &nbsp; [] &nbsp; &#35; mention your secret access key without square brackets