#!/usr/bin/env python
import boto3

ec2 = boto3.client("ec2")
asg = boto3.client("autoscaling")

def main():
    # TODO: handle pagination
    response = asg.describe_auto_scaling_groups()
    next_token = response.get("NextToken")
    if next_token:
      raise RuntimeError("Too many ASGs")

    autoscaling_groups = response["AutoScalingGroups"]
    for group in autoscaling_groups:
        group_name = group["AutoScalingGroupName"]
        print(f"{group_name}\n{'=' * len(group_name)}")
        group_instances = group["Instances"]
        for instance in group_instances:
            iid = instance["InstanceId"]

            instance_descriptions = ec2.describe_instances(InstanceIds=[iid])
            private_dns = instance_descriptions["Reservations"][0]["Instances"][0]["PrivateDnsName"]
            print(f"    {private_dns}")

if __name__ == "__main__":
    main()
