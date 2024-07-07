# Main.tf file

provider "aws" {
  region = "us-east-1"  # Change to your desired region
  
}

resource "aws_instance" "example" {
  ami           = "ami-0e001c9271cf7f3b9"  # Change to your desired AMI ID
  instance_type = "t2.medium"

  key_name = "terra_key"

  # Reference the user_data script
  user_data = file("install_data.sh")

  # Define tags
  tags = {
    Name = "ExampleInstance"
  }
}

output "instance_id" {
  value = aws_instance.example.id
}

output "public_ip" {
  value = aws_instance.example.public_ip
}
