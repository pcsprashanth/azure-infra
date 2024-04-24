Module Overview
This module is designed to manage Azure resources using Terraform and Azure Policy. It includes a set of policy definitions, policy assignments, and archetype definitions that are used to enforce specific configurations and settings across different Azure resources.

Archetype Definitions
Archetype definitions are JSON files that specify a set of policy assignments, policy definitions, and policy set definitions to be applied. They also include an archetype_config section which can be used to specify parameters for the policies and access control settings.

For example, the archetype_definition_es_root.tmpl.json file defines an archetype with policy assignments like "Not-Allowed-Resources" and "ES-Root-Policies", and a policy definition "Deploy-ASC-SecurityContacts".


Policy Assignments
Policy assignments are JSON files that specify how a policy or initiative is assigned. They include the parameters to be used in the assignment.

For instance, the policy_assignment_es_root_intiative.json file includes parameters for enabling or disabling Azure Security Center for various Azure resources.

Policy Definitions
Policy definitions are JSON files that define a policy rule. They include the conditions under which the policy is enforced and the effect that takes place when the conditions are met.

For example, the policy_definition_es_deploy_asc_securitycontacts.json file defines a policy for deploying Azure Security Center security contacts.

Terraform Configuration
The main.tf file is a Terraform configuration file that defines the Azure resources to be created. It uses variables to specify the configuration of the resources.

Key Concepts
Azure Policy: Azure Policy is a service in Azure that you use to create, assign, and manage policies. These policies enforce different rules and effects over your resources, so those resources stay compliant with your corporate standards and service level agreements.

Terraform: Terraform is an open-source infrastructure as code software tool that provides a consistent CLI workflow to manage hundreds of cloud services. Terraform codifies APIs into declarative configuration files.

Archetype: In this context, an archetype is a predefined template of a combination of policy definitions and assignments that can be used to apply a specific configuration to Azure resources.

