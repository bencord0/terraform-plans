#!/usr/bin/env python
import ovh
from tabulate import tabulate

OVH = ovh.Client('ovh-eu')
CREDENTIAL_URL = '/me/api/credential/{credential_id}'
APPLICATION_URL = '/me/api/credential/{credential_id}/application'


def parse_rules(rules):
    parsed_rules = []
    for rule in rules:
        parsed_rule = f"{rule['method']} {rule['path']}"
        parsed_rules.append(parsed_rule)

    return ', '.join(parsed_rules)


def main():
    credentials = OVH.get('/me/api/credential', status='validated')

    table = []
    for credential_id in credentials:
        credential = OVH.get(CREDENTIAL_URL.format(credential_id=credential_id))
        application = OVH.get(APPLICATION_URL.format(credential_id=credential_id))

        table.append([
            credential_id,
            '[%s] %s' % (application['status'], application['name']),
            application['description'],
            credential['creation'],
            credential['expiration'],
            credential['lastUse'],
            parse_rules(credential['rules']),
        ])
    print(tabulate(table, headers=[
        'ID', 'App Name', 'Description',
        'Token Creation', 'Token Expiration', 'Token Last Use',
        'Rules'
    ]))


if __name__ == "__main__":
    main()
