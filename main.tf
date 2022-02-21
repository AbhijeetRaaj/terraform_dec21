resource "aws_instance" "ec2_instance1" {
	ami = "ami-0851b76e8b1bce90b"
	instance_type = "t2.micro"
	
	tags = {
		Name = "ap-south-1"
	}
}

resource "aws_instance" "ec2_instance2" {
	provider = aws.region1
	ami = "ami-04505e74c0741db8d"
	instance_type = "t2.micro"
	
	tags = {
		Name = "us-east-1"
	}
}
