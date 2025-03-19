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

 variable "prefix" {}

 variable "region" {
  type          = string
  default       = "westus"
  description   = "The Azure region to deploy resources"
  validation {
    condition = contains(["UK South", "UK West", "eastus", "West Europe", "westus"], var.region)
    error_message = "Invalid Region"
  }  
 }

 variable "tags" {
  type          = map(any)
  description   = "A map of tags"  
 }

 resource "azurerm_resource_group" "contoso_rg" {
   name         = "${var.prefix}_rg"
   location     = var.region
   tags         = var.tags
 }

 resource "azurerm_resource_group" "contoso_dev_rg" {
    name        = "${var.prefix}_dev_rg"
    location    = var.region
    tags        = var.tags
 }
