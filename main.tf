terraform {
  required_version = ">= 1.5.0"

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

variable "environment" {
  type        = string
  description = "Environment name injected by Terrakube workspace variable"
}

resource "random_pet" "application" {
  prefix    = var.environment
  length    = 2
  separator = "-"
}

output "application_name" {
  description = "Lab output for workspace comparison"
  value       = random_pet.application.id
}