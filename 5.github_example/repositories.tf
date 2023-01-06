resource "github_repository" "terraform_test_repo" {
  name        = "terraform_test_repo"
  description = "My test repo created using Terraform"

  visibility = "public"

  auto_init = true
  #this creates a README.md file automatically
}