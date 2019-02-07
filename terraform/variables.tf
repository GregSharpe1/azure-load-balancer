variable "instance_tags" {
  type = "map"

  default {
    Name = "DOG-Application"

    # When taggged with Development this image will be brought down every night at 8pm and brought back up at 8am (yet to implement)
    Environment = "Development"
  }
}

variable "location" {
  default = "East US"
}
