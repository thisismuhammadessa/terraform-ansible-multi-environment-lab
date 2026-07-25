resource "aws_s3_bucket" "my_bucket" {
    bucket = "${var.env}-twa-junoon-app-bucket"
    tags = {
        Nmae = "${var.env}-twa-junoon-app-bucket"
        Environment = var.env
    }  
}
