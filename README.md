# betadots Puppet Demo Control Repo

This is a demo Puppet control-repo, where we show best practices on Puppet coding and data structures

## Node classification

Node classification is done via hiera.

There are two hiera keys which are important:
- windows_classes_hash
- linux_classes_hash

Depending on the node Kernel fact, we run a lookup function from `manifests/site.pp`.

Each hash consists of an unique identifier and a puppet class.

    ---
    linux_classes_hash:
      'time': 'profile::time::linux'
    
    windows_classes_hash:
      'time': 'winntp'
    
    winntp::servers:
      - 'time.nist.gov'
      - 'pool.ntp.org'
    
    profile::time::linux::servers:
      - 'ntp.ptb.de'

## Hiera configuration

In hiera we use trusted variables and fact variables to identify the hiera layers.

## Puppet Modules

Puppet modules are listed in Puppetfile.
Some modules might be outdated.

Copyright (c) betadots GmbH 2022

