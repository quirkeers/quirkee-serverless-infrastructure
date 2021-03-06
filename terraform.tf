module "quirkee_api_gateway" {
  source = "./quirkee-api-gateway"

  env = var.env
  name = var.name
  authorizer_type = var.authorizer_type
  lambda_arn = module.quirkee_lambda.lambda_arn
}

module "quirkee_lambda" {
  source = "./quirkee-lambda"

  env = var.env
  name = var.name

  api_gateway_api_execution_arn = module.quirkee_api_gateway.api_gateway_api_execution_arn

  handler_path = var.handler_path
  node_project_path = var.node_project_path
  s3_bucket = module.quirkee_lambda_s3_bucket.app_bucket_id

  SERVICE_TO_SERVICE_OAUTH_CLIENT_URI =  var.SERVICE_TO_SERVICE_OAUTH_CLIENT_URI
  SERVICE_TO_SERVICE_OAUTH_CLIENT_ID =  var.SERVICE_TO_SERVICE_OAUTH_CLIENT_ID
  SERVICE_TO_SERVICE_OAUTH_CLIENT_SECRET =  var.SERVICE_TO_SERVICE_OAUTH_CLIENT_SECRET
  AWS_S3_ACCESS_KEY = var.AWS_S3_ACCESS_KEY
  AWS_S3_KEY_SECRET = var.AWS_S3_KEY_SECRET

  attach_policy_jsons = var.attach_policy_jsons
  policy_jsons = var.policy_jsons
  number_of_policy_jsons =  var.number_of_policy_jsons
}

module "quirkee_lambda_s3_bucket" {
  source = "./quirkee-s3-bucket"

  env = var.env
  name = var.name
}
