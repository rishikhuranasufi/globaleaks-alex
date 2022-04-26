# globaleaks-alex
<b> Pre-requisite : </b>
  - You need to have AWS account created. 
  - You need to have access key and secret from that AWS accounts
  - You must have a ubuntu 20.04 VM launched in which following steps will be followed 

  <b>NOTE : these are one time steps to be followed on manually created Linux VM. Next time onwards, its just terraform commands needs to be executed which will create new instance and also install globaleaks on it as docker container.    </b>

# Instructions for installing docker and run container remotely using terraform.

- Update the your Linux workstation , and install the 'tree' and 'unzip' commands using: 
    
    ```
    $  sudo  apt-get  update  -y  &&  sudo  apt-get  upgrade  -y 
    $  sudo  apt-get  install  -y  tree  unzip  wget
    ```
- Now install terraform using below commands one by one:
    
    ```
    $  wget https://releases.hashicorp.com/terraform/1.1.8/terraform_1.1.8_linux_amd64.zip
    ```
    
    Note: Above command is in one line.
    
    ```
    $  unzip   terraform_1.1.8_linux_amd64.zip
    $  sudo  mv  terraform  /usr/local/bin
    ```
    
- Verify your terraform installation using:
    ```
    $ terraform -v
    ```
    
- Then install AWS CLI using  below commands one by one:
    ```
    $  curl  "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.0.30.zip"  -o "awscliv2.zip"  Note: The above command should be one line.
    $  unzip  awscliv2.zip
    $  sudo  ./aws/install
    ```
    
- Verify AWS CLI installation: 
    ```
    $  aws  --version
    ```
    
- Now configure your username and email address for git on your remote workstation, then check the configuration:  $  git  config  --global  user.name  "Your-Firstname Your-Lastname"
    ```
    $  git  config  --global  user.email  Your-email@address.com
    $  git  config  --global  --list
    ```

- Now also configure the AWS CLI:  $   aws  configure
    
    ```
    AWS Access Key ID: <enter your access key>
    AWS Secret Access Key: <enter your secret key>
    region: <enter your region>
    output format: table
    ```
    
- Then edit your aws credentials using:
    ```
    $   sudo vi ~/.aws/credentials
    ```

  - Now just copy the whole default credentials and paste it just below it.

  - Then rename your copied  credentials profile denoted by square brackets with  [globaleaks]

  - Save and exit the file.

- Then make a directory “globaleaks_project” and  clone a globaleaks repo from github to your workstation using:
    ```
    $   git clone git@github.com:ashisharintech/globaleaks.git
    ```
    
- Make a  directory named “keys” inside globaleaks and inside keys directory generate public and private using : 
    ```
    $   ssh-keygen
    ```
    
  - Then enter the name to your key as “globaleaks-vm-key”

  - Don’t use paraphrase, just press enter.

- Now, first initialize, validate and apply in your system, networking and  instances (IN SAME SEQUENCE ) directory present inside the globaleaks directory that you have cloned in step 9 :

  NOTE:  Run below commands one by one in sequence from system, networking and at last in  instances directory.
    ```
    $  terraform init
    $  teraform validate
    $  terraform apply
    ```
    
- After applying the configuration in instances directory, you will notice that apply is completed successfully and giving you output as “globaleaks_vm” with an IP address.
 
   - Just copy that IP and paste in your public IP addess to browser :

    3.138.135.85

- You will get a output like as shown below :
  NOTE: This output depicts that your docker container is running successfully.
  <img width="432" alt="image" src="https://user-images.githubusercontent.com/9928392/165320057-d796d182-86c8-4df6-8831-67619ec3c8c9.png">


- You can also verify this by SSH into your globaleaks_vm using below command:
    ```
    $  ssh  –i  ~globaleaks_prject/globaleaks/keys/globaleaks-vm-key   username@globaleaks_vm_IP
    ```
    
    NOTE:  Here “globaleaks_prject/globaleaks/keys/globaleaks-vm-key” is the private key path that we have generated in step 10 and “username@globaleaks_vm_IP” is your username and globaleaks_vm  IP address generated  using  terraform in step 12.

- After ssh into vm , now run below command to verify the status of the container:
    ```
    $   docker ps –a 
    ```
    
    NOTE:  You will notice that the container is running showing status as “up”.

