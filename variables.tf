 variable resource_groups {
  type          = map(string)
  description   = "The resource groups to deploy"
 }

 variable "prefix" {
  type          = string
  description   = "A prefix for all resources"
  default       = "contoso"
 }

 variable "region" {
  type          = string
  default       = "westus"
  description   = "The Azure region to deploy resources"
  validation {
    condition = contains(["UK South", "UK West", "eastus", "North Europe", "westus"], var.region)
    error_message = "Invalid Region"
  }  
 }

 variable "tags" {
  type          = map(any)
  description   = "A map of tags"  
 }

 variable "virtual_networks" {
   type = map(object({
     name               = string
     resource_group_key = string
     address_space      = list(string)
     subnets = map(object({
       name           = optional(string)
       address_prefix = string
     }))
   }))
   description = "The virtual networks to deploy"
 }