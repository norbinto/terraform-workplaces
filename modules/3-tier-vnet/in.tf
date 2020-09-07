variable "group"{
    type = string
}

variable "location" {
    type=string
}

variable "address_space" {
    type=list(string)
}

variable "apisubnet" {
    type=list(string)
}

variable "datasubnet" {
    type=list(string)
}