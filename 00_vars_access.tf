## Access SSH key
variable "ssh-key" {
  type    = string
  default = "exam_rsa.pub" # Optionally replace exam_rsa.pub with path to your public SSH key
}