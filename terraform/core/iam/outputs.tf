output "eks_cluster_role_arn" {
  description = "ARN of EKS cluster IAM role"
  value       = aws_iam_role.eks_cluster.arn
}

output "eks_node_group_role_arn" {
  description = "ARN of EKS node group IAM role"
  value       = aws_iam_role.eks_node_group.arn
}

output "karpenter_controller_role_arn" {
  description = "ARN of Karpenter controller IAM role"
  value       = aws_iam_role.karpenter_controller.arn
}

output "karpenter_instance_profile_name" {
  description = "Name of instance profile for Karpenter nodes"
  value       = aws_iam_instance_profile.karpenter.name
}
