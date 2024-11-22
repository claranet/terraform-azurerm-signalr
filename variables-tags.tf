variable "default_tags_enabled" {
  description = "Option to enable or disable default tag.s"
  type        = bool
  default     = true
}

variable "extra_tags" {
  description = "Additional tags to associate with your autoscale setting."
  type        = map(string)
  default     = null
}
