# Specifiy the provider and version
 terraform {
   required_providers {
     azurerm = {
       source  = "hashicorp/azurerm"
       version = "~> 4.0"
     }
   }
 }
    
 # Configure the Microsoft Azure Provider
 provider "azurerm" {
   features {}
 }

 resource "azurerm_resource_group" "demo" {
   for_each     = var.resource_groups
   name         = "${var.prefix}_${each.value}"
   location     = var.region
   tags         = var.tags
 }

 
