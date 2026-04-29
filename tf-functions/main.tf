terraform {}

locals {
  value = "Hello World!"
}

variable "string_list" {
  type    = list(string)
  default = ["serv1", "serv2", "serv3", "serv1"]
}

output "output" {
  #value = upper(local.value)
  #value = startswith(local.value, "hello")
  #value = split(" ", local.value)
  #value = min(1, 2, 3, 4, 5)
  #value = abs(-15.123)
  #value = length(var.string_list)
  #value = join(":", var.string_list)
  #value = contains(var.string_list, "serv1")
  #value = toset(var.string_list) #removed the duplicates

  value = {
    upper = upper(local.value)
    startswith = startswith(local.value, "hello")
    split = split(" ", local.value)
    min = min(1, 2, 3, 4, 5)
    abs = abs(-15.123)
    length = length(var.string_list)
    join = join(":", var.string_list)
    contains = contains(var.string_list, "serv1")
    toset = toset(var.string_list) #removed the duplicates
  }
}