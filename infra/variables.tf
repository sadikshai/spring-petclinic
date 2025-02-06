variable "resource_group_info" {
  type = object({
    name     = string
    location = string
  })

}


variable "aks_info" {
  type = object({
    name       = string
    node_count = optional(number, 1)
    node_size  = optional(string, "Standard_B2ms")
  })
  description = "aks cluster info"

}

variable "build_id" {
  type    = string
  default = "1"
}