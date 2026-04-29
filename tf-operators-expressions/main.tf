terraform {
  
}

variable "number_list" {
  type = list(number)
  default = [ 1 , 2 , 4 , 5 , 6 ]
}

# Object list of persons 
variable "list_of_persons"{
  type = list(object({
    fname = string 
    lname = string 
  }))
  default = [
    {
      fname = "yash",
      lname = "N"
    },
    {
      fname = "shiv"
      lname = "yadav"
    }
  ]
}

variable "map_list"{
  type = map(number)
  default = {
    "one" = 1 
    "two" = 2
  }
}



output "number_list_object" {
  value = {
    full_list  = var.number_list
    first_item = var.number_list[0]
    person_list = var.list_of_persons
    map_list = var.map_list
  }
}


# calculations 

locals {
  mul = 2 * 2 
  add = 2 + 2 
  eq = 2 != 2 

  double_list = [for num in var.number_list:  num*2 ]

  odd_no_only = [for num in var.number_list: num if num % 2 != 0 ]

  # to get only fname of every person 

  fname_list = [ for person in var.list_of_persons : person.fname ]

  map_list = [ for key , value in var.map_list : value ]

  double_map_list = { for key , value in var.map_list : key => value * 2 }

}

output "results" {
  value = {
    name = local.double_map_list
    yes = var.map_list
  }
}