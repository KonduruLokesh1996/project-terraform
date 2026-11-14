data "aws_ami" "joindevops" {
    most_recent = true
    owners = [" " ]

    filter {
        name = "name"
        values = ["Redhat-9-Devops-Practice"]

    }
     filter {
        name = "name"
        values = ["hvm"]
     }

}

output "ami_id" {
    value = data.aws_ami.joindevops.id
}