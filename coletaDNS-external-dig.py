#!/usr/bin/python3

import dns.resolver

def get_domain_dns(domain):
        """Get the DNS record, if any, for the given domain."""
        dns_records = list()

        try:
            resolver = dns.resolver.Resolver()
            resolver.nameservers = ['8.8.8.8']

            # get the dns resolutions for this domain
            dns_results = resolver.query(domain, "A")
            dns_records = [ip.address for ip in dns_results]
        except dns.resolver.NXDOMAIN as e:
            # the domain does not exist so dns resolutions remain empty
            pass
        except dns.resolver.NoAnswer as e:
            # the resolver is not answering so dns resolutions remain empty
            pass
        except dns.exception.Timeout as e:
            # timeout
            pass

        return dns_records


f = open("lista-nomes.txt", "r")

for domain in f.readlines():
    domain = domain.rstrip('\n')
    print("{}; {}".format(domain, get_domain_dns(domain)))

f.close()% 
