#!/usr/bin/env python
import argparse
import boto3

parser = argparse.ArgumentParser()
parser.add_argument("name")
parser.add_argument("--desired", type=int, required=True)

asg = boto3.client("autoscaling")

def main():
    args = parser.parse_args()

    response = asg.update_auto_scaling_group(
        AutoScalingGroupName=args.name,
        DesiredCapacity=args.desired
    )

if __name__ == "__main__":
    main()
