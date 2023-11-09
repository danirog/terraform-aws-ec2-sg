# data sources to get sg

data "terraform_remote_state" "sg" {
  backend = "local"

  config = {
    path = "../SG/terraform.tfstate"
  }
}
