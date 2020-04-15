# testPortfolio

- Installed Terraform
- Initialized Terraform 
- Update .gitignore to ignore all .tfstate files
- Create .config file containing reigion, key, and bucket name
- Create .tf files to create a private S3 bucket and one to create a bucket enabled for static website hosting
- Use terraform plan -out to save plan
- terraform apply and terraform destroy to create and delete bucket
 
- Use git reset head to rollback to a previous commit in git
- git log to show commit history
- aws s3 cp ../index.html s3://achandratre-testsite/ --acl public-read
   - upload: ../index.html to s3://achandratre-testsite/index.html

 aws s3 cp ../index.html s3://test-site.achandratre.info/ --acl public-read
 aws s3 rm s3://test-site.achandratre.info/index.html

