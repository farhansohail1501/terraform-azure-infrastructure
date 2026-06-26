# Action Group — WHO gets notified (you, by email)
resource "azurerm_monitor_action_group" "this" {
  name                = "ag-webapp-alerts"
  resource_group_name = var.resource_group_name
  short_name          = "webappag"

  email_receiver {
    name          = "admin"
    email_address = var.alert_email
  }

  tags = var.tags
}

# Metric Alert — WHEN to notify (VM CPU over 80%)
resource "azurerm_monitor_metric_alert" "cpu" {
  name                = "alert-vm-high-cpu"
  resource_group_name = var.resource_group_name
  scopes              = [var.vm_id]
  description         = "Alert when VM CPU exceeds 80%"
  severity            = 2
  frequency           = "PT1M"
  window_size         = "PT5M"

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "Percentage CPU"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 80
  }

  action {
    action_group_id = azurerm_monitor_action_group.this.id
  }

  tags = var.tags
}