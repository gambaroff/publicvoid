#Public_Void is an applications for long term cloud storage of large video assets.  

The objective of the application is to free us from video clutter and provide an inexpensive backup solution that you can control yourself!

This application is currently in the alpha developent phase.  An inception phase has already been completed which provides a UI for file upload.  Upload to cloud is the target for the next iteration.

To set up this app, you need a running ec2 instance with:
* RVM
* Ruby 2.0.0
* AWS S3 credentials
* a postgres database instance

*****
 RVM
*****
as root:

\curl -sSL https://get.rvm.io | bash -s stable
rvm get stable
source /etc/profile.d/rvm.sh
git clone https://github.com/gambaroff/publicvoid.git
cd publicvoid


******
 Ruby
******
rvm install ruby-2.0.0-p353
cd ~
cd -
bundle install

*****
 AWS
*****

Create an IAM user with access to S3

Use the following CORS configuration on the bucket you create:

<CORSConfiguration xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
    <CORSRule>
        <AllowedOrigin>http://[enter app URL here]</AllowedOrigin>
        <AllowedMethod>POST</AllowedMethod>
        <AllowedMethod>GET</AllowedMethod>
        <AllowedMethod>PUT</AllowedMethod>
        <MaxAgeSeconds>3000</MaxAgeSeconds>
        <AllowedHeader>*</AllowedHeader>
    </CORSRule>
</CORSConfiguration>

for that user, add the following to your ~/.bash_profile (on the ec2 instance):
export AWS_ACCESS_KEY_ID=[your access key]
export AWS_SECRET_ACCESS_KEY=[your secret key]
export S3_BUCKET_NAME=[your s3 bucket]

then source the file:
source ~/.bash_profile

************
 PostgreSQL
************

Create an RDS instance (running pg on your instance will work too). Then run:
ruby setup.rb

The setup file will prompt you for the credentials you just made on the RDS instance.

rake db:migrate ENV=production

If rake complains that you cannot access the db, try using the psql command-line:
psql -h [hostname] -p [port] -u [username]

This could be due to firewall issues.  Check the rules in your security group.

*************
 Starting up
*************

rails s -e production -p80

******
 TODO
******

Set up passenger/capistrano to automate this process, and run SSL (which is critical for a real prod environment) 
See https://github.com/gambaroff/publicvoid/issues/24