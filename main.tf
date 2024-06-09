#create S3 bucket
resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucketname
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.mybucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.mybucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.example,
    aws_s3_bucket_public_access_block.example,
  ]

  bucket = aws_s3_bucket.mybucket.id
  acl = "public-read"
}

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.mybucket.id
  key = "index.html"
  source = "index.html"
  acl = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.mybucket.id
  key = "error.html"
  source = "error.html"
  acl = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "style_css" {
  bucket = aws_s3_bucket.mybucket.id
  key = "style.css"
  source = "style.css"
  acl = "public-read"
  content_type = "text/css"
}


resource "aws_s3_object" "Shivam_Photo" {
bucket = aws_s3_bucket.mybucket.id
key = "Shivam Photo.png"
source = "Shivam Photo.png"
acl = "public-read"
content_type = "image/png"
}

resource "aws_s3_object" "github" {
bucket = aws_s3_bucket.mybucket.id
key = "github.png"
source = "github.png"
acl = "public-read"
content_type = "image/png"
}

resource "aws_s3_object" "linkedin" {
bucket = aws_s3_bucket.mybucket.id
key = "linkedin.png"
source = "linkedin.png"
acl = "public-read"
content_type = "image/png"
}

resource "aws_s3_object" "Shivam_Patel" {
bucket = aws_s3_bucket.mybucket.id
key = "Shivam_Patel.pdf"
source = "Shivam_Patel.pdf"
acl = "public-read"
content_type = "application/pdf"
}



resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.mybucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  depends_on = [ aws_s3_bucket_acl.example ]
  }

# Create a Route 53 hosted zone
# resource "aws_route53_zone" "main" {
#   name = var.domain_name
# }

# resource "aws_route53_record" "www" {
#   zone_id = aws_route53_zone.main.zone_id
#   name    = "www.${var.domain_name}"
#   type    = "A"


#  alias {
#     name                   = aws_s3_bucket.mybucket.website_endpoint
#     zone_id                = "Z1QDHH18159H29"  # S3 website endpoint hosted zone ID for ca-central-1
#     evaluate_target_health = false
# }
# }

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.mybucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = "s3:GetObject"
        Resource = "${aws_s3_bucket.mybucket.arn}/*"
      },
      {
        Effect = "Allow"
        Principal = "*"
        Action = "s3:ListBucket"
        Resource = aws_s3_bucket.mybucket.arn
      }
    ]
  })
}
