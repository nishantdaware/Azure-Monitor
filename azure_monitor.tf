// Log analytics workspace 

resource "azurerm_log_analytics_workspace" "la_workspace" {
  name                = "LogAnalyticsWorkspace"
  location            = var.location
  resource_group_name = var.resource_group
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

// Action Group and Alert Rule to send email when any VM restarts

resource "azurerm_monitor_action_group" "alert_group" {
  name                  = "${var.prefix}-action-group"
  resource_group_name   = var.resource_group
  short_name            = "actgrp"

  email_receiver {
    name          = "emailadmin"
    email_address = "nishantdaware13@gmail.com"
    }
}

resource "azurerm_monitor_activity_log_alert" "vm_restart_alert" {
  name                  = "vm-restart-alert"
  location              = var.location_alert
  resource_group_name   = var.resource_group
  scopes                = values(local.vm_ids)

  description = "Alert when any VM restarts"
  criteria {
    category       = "Administrative"
    operation_name = "Microsoft.Compute/virtualMachines/restart/action"
    resource_type  = "Microsoft.Compute/virtualMachines"
  }

  action {
    action_group_id = azurerm_monitor_action_group.alert_group.id
  }
}

data "azurerm_subscription" "primary" {}
