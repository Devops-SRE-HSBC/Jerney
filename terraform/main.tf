module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "jerney-eks"
  cluster_version = "1.29"

  enable_irsa = true

  # 👇 THIS IS THE FIX
  access_entries = {
    cloud_user_admin = {
      principal_arn = "arn:aws:iam::763487052879:user/cloud_user"
      policy_associations = {
        admin = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
          access_scope = {
            type = "cluster"
          }
        }
      }
    }
  }
}
``
