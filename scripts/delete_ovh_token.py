#!/usr/bin/env python
import ovh
from argparse import ArgumentParser
from tabulate import tabulate

parser = ArgumentParser()
parser.add_argument('credential_id')

URL = '/me/api/credential/{credential_id}'
OVH = ovh.Client('ovh-eu')


def main():
    args = parser.parse_args()
    OVH.delete(URL.format(credential_id=args.credential_id))


if __name__ == "__main__":
    main()
