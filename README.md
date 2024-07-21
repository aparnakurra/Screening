
## TEK systems Screening 
1. [Part1: Cybersecurity Scenario](#part1-cybersecurity-scenario)
2. [Part2: Container Security Implementation](#part2-container-security-implementation)
3. [Part3: CI/CD Pipeline Setup](#part3-cicd-pipeline-setup)
 
# Part1: Cybersecurity Scenario

## Task1: Threat Intelligence Report
### Types of Attacks That Could Be Used 
* SQL Injection
* Cross-Site Scripting (XSS)
* Remote Code Execution (RCE)
* Path Traversal
* Credential Stuffing

### How a Vulnerability Exploited Can Provide Access to the Network
* Attackers exploit an unpatched vulnerability in the web application, such as an RCE or SQL injection, to gain initial access to the application server.
* Once inside, attackers can move laterally within the network by leveraging weak security configurations or additional vulnerabilities in the infrastructure.
* Attackers can exploit further vulnerabilities or misconfigurations to escalate their privileges, gaining administrative access.
* Attackers use stolen credentials or compromised systems to move laterally across the network, accessing additional systems and data stores.
* Attackers extract sensitive data from databases, file servers, or cloud storage services.
### Suggest preventive measures to avoid similar incidents in the future 
We can follow below steps to prevent similar incidents in future 
* **Regular Patching:** Implement an automated patch management system using AWS Systems Manager Patch Manager to ensure all systems are up-to-date with the latest security patches.
* **Web Application Firewalls (WAF):** Deploy AWS WAF to protect web applications from common threats like SQL injection and XSS.
* **Security Audits:** Conduct regular security audits and vulnerability assessments using AWS Inspector to identify and remediate security weaknesses.
* **Secure Coding Practices:** Implement secure coding practices and conduct regular code reviews. Use AWS CodePipeline and AWS CodeBuild to automate security testing in the CI/CD pipeline.
* **Multi-Factor Authentication (MFA):** Enable MFA for all users, especially for IAM users with administrative privileges, to add an extra layer of security.

## Task2: Incident Response Plan
### Incident Response Plan Outline:

* **Preparation:** Develop and maintain an incident response policy and procedures, ensuring they are tailored for AWS environments.
Train the incident response team and conduct regular incident response drills using AWS CloudTrail logs for historical analysis.
* **Identification:** Detect and analyze the breach using AWS CloudTrail, AWS Config, and AWS GuardDuty to gather detailed information about the incident.
Verify the breach and classify the severity level using AWS Security Hub for centralized security findings.
* **Containment:** Short-Term Containment: Isolate affected EC2 instances by modifying AWS Security Groups to block incoming and outgoing traffic.
Long-Term Containment: Apply patches, update configurations, and implement WAF rules to prevent further exploitation.
* **Eradication:** Identify and remove the root cause of the breach, such as deleting compromised instances, cleaning malware, and patching vulnerabilities.
Conduct a thorough investigation using AWS Detective to ensure all traces of the attacker are eliminated.
* **Recovery:** Restore affected systems and services to normal operation using AWS Backup to recover data and AWS Elastic Disaster Recovery for system restoration.
Monitor the systems closely for any signs of residual compromise using Amazon CloudWatch and AWS CloudTrail.
* **Lessons Learned:** Conduct a post-incident analysis to identify lessons learned and areas for improvement.
Update incident response plans, security measures, and staff training based on findings from the incident.


## Task3: Network Security Measures
### Recommended Network Security Measures:

Deploy AWS Network Firewall to monitor and block malicious traffic.
Utilize AWS GuardDuty for continuous threat detection and monitoring, integrating findings into AWS Security Hub for centralized visibility.

* **Firewalls:** Implement AWS WAF to protect web applications from common exploits.
Use AWS Security Groups and Network ACLs to control inbound and outbound traffic at both the instance and subnet levels.
* **Network Segmentation:** Use custom VPC to create isolated network segments, implementing centralized network using Transit Gateway to manage interconnectivity securely.
Implement network segmentation within VPCs using subnets and Security Groups to isolate critical systems and sensitive data.
* **Access Control:** Enforce strict access control policies using IAM roles and policies, adhering to the principle of least privilege.
Implement AWS Identity and Access Management (IAM) for granular access control and enable MFA for additional security.
* **Regular Security Assessments:** Conduct regular penetration testing and vulnerability assessments using AWS Inspector.
Perform continuous monitoring and logging using Amazon CloudWatch, AWS CloudTrail, and AWS Config to detect and respond to anomalies in real-time.

By leveraging AWS security tools and services, the organization can significantly enhance its defense posture and mitigate the risk of future breaches.


# Part2: Container Security Implementation
## Task1:Five Docker Security Best Practices:

* **Use Official and Trusted Images:** Always use official images from Docker Hub or other trusted sources. These images are maintained and regularly updated to ensure security.
* **Run Containers as Non-Root User:** Running containers as a non-root user minimizes the impact of a container compromise, preventing the attacker from gaining root access to the host system.
* **Keep Images Minimal:** Use minimal base images to reduce the attack surface. Smaller images have fewer components that could potentially be exploited.
* **Scan Images for Vulnerabilities:** Regularly scan Docker images for vulnerabilities using tools like Docker's built-in scanning tool or third-party solutions like Clair or Trivy.
* **Use Docker Content Trust (DCT):**Enable Docker Content Trust to ensure the integrity and authenticity of images by signing and verifying them.

[here](https://github.com/aparnakurra/Screening/blob/Dockerfile) Implementation in a Dockerfile:

## Task2: Kubernetes Security Configuration 
* **Role-Based Access Control (RBAC):** RBAC allows you to define permissions and access controls within your Kubernetes cluster. You can specify what actions users or applications can perform, reducing the risk of unauthorized access.
* **Network Policies:** Network Policies allow you to control the communication between pods within a Kubernetes cluster. By defining which pods can communicate with each other, you can isolate applications and limit the spread of potential breaches.
* **Pod Security Policies (PSP):** Pod Security Policies define a set of conditions that a pod must meet to be accepted into the cluster. This includes restricting privileged operations, enforcing read-only root filesystems, and setting user IDs.
[here](https://github.com/aparnakurra/Screening/blob/src/k8s.yaml) Kubernetes YAML Configuration 

## Task3: IaaS Security Measures
**Concept of Infrastructure as a Service (IaaS) and Its Security Implications:**

* Infrastructure as a Service (IaaS) is a cloud computing model that provides virtualized computing resources over the internet. IaaS offers scalable and automated computing environments, where users can rent virtual machines (VMs), storage, and networking resources on demand. This allows organizations to avoid the cost and complexity of purchasing and managing physical servers and data center infrastructure.
* In IaaS, the cloud provider is responsible for the security of the underlying infrastructure (e.g., physical servers, storage, and networking), while the user is responsible for securing the data, applications, and operating systems they run on the IaaS platform. This shared responsibility model requires users to be vigilant about their security practices, including configuring firewalls, managing access controls, and securing data.
Access Management:
* Managing access to IaaS resources is crucial. Using AWS IAM, users can define who has access to specific resources and what actions they can perform. Implementing the principle of least privilege ensures that users have only the permissions necessary to perform their tasks, reducing the risk of unauthorized access.
Data Security:
* In an IaaS environment, data security involves encrypting data at rest and in transit. AWS offers services like AWS Key Management Service (KMS) for managing encryption keys, and Amazon S3 provides server-side encryption for data stored in S3 buckets. Users must ensure that sensitive data is encrypted and that encryption keys are managed securely.
* Securing the network in an IaaS environment involves configuring Virtual Private Clouds (VPCs), security groups, and network access control lists (ACLs) to control inbound and outbound traffic. AWS VPC enables users to create isolated networks and define security rules to protect their instances from unauthorized access.
By understanding and implementing these security measures, organizations can effectively secure their IaaS environments and protect their data and applications from potential threats.

# Part3: CI/CD Pipeline Setup
## Task1: Configuration Management with Terraform
In  this task I'll use Terraform to automate the deployment of a web server on a virtual machine. here [code](https://github.com/aparnakurra/Screening/blob/src/web.tf) will show how to create an EC2 instance in AWS and install a simple web server (Nginx) on it.

## Task2: CI/CD Pipeline Configuration
This task I'll use Jenkins pipeline configuration, checkout [here](https://github.com/aparnakurra/Screening/blob/Jenkinsfile) 
