**Azure Alerting using Terraform**

This project provisions an Azure Monitor Activity Log Alert to send an email notification whenever any Virtual Machine is restarted within a given scope. It also creates an Action Group for alert notifications and a Log Analytics Workspace for monitoring.

**Features:**

- Creates a Log Analytics Workspace for storing activity logs.
- Creates an Action Group that sends an email notification.
- Configures an Activity Log Alert to monitor VM restart events (Microsoft.Compute/virtualMachines/restart/action).
- Scope can include multiple VMs.
- Fully automated using Terraform.

**Alert Details:**

- Category: Administrative
- Operation Name: Microsoft.Compute/virtualMachines/restart/action
- Resource Type: Microsoft.Compute/virtualMachines
- Action: Sends email via Action Group

**Steps to Deploy:**

1. Clone the Repository
    - git clone <your-repo-url>
    - cd <your-project-folder>
    - update resource group in variables and subscription number in providers with respect to your azure subscription details.

2. Initialize Terraform
    - terraform init

3. Validate the Configuration
    - terraform validate

4. Plan the Deployment
    - terraform plan

5. Apply the Configuration
    - terraform apply

**Testing the Alert:**

1. Restart any VM in the specified scope from the Azure Portal or CLI:
    - az vm restart --resource-group resource-group-name --name vm-name

2. Check the email inbox for the alert notification.
