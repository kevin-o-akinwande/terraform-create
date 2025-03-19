 variable "prefix" {}

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