#!/bin/sh

instance_ids="$(aws autoscaling describe-auto-scaling-groups| jq -r '.AutoScalingGroups[].Instances[].InstanceId')"

for iid in $instance_ids; do
  aws ec2 describe-instances --instance-ids $iid | jq -r '.Reservations[].Instances[].PrivateDnsName'
done
