# Jenkins

## Prerequisites
1. Java 8
2. Supported OS (RHEL covered in this readme)
3. Search for the the installation mode for appropriate platform in https://jenkins.io/download/

**Installation Steps**  

1. Download the jenkins package.  
    ```wget -P /tmp https://pkg.jenkins.io/redhat-stable/jenkins-2.138.2-1.1.noarch.rpm```
2. Install the RPM package.  
    ```cd /tmp && rpm -ivh jenkins-2.138.2-1.1.noarch.rpm```
3. Verify the installation of jenkins.  
    ```rpm -q jenkins-2.138.2-1.1.noarch or service jenkins status```
4. Start the jenkins.  
    ```service jenkins start```
5. Access the jenkins through on the port 8080.
6. log on to the jenkins machine to extract the password to unlock Jenkins.  
    ``` cat /var/lib/jenkins/secrets/initialAdminPassword```
7. After entering password in the UI, choose install recommended plugins.
8. Create the first admin user in the next page with username, password, name and email address.
