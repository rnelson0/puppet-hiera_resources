# hiera_resources

[![Build Status](https://travis-ci.org/rnelson0/puppet-hiera_resources.png?branch=master)](https://travis-ci.org/rnelson0/puppet-hiera_resources)
[![Puppet Forge](http://img.shields.io/puppetforge/v/rnelson0/hiera_resources.svg)](https://forge.puppetlabs.com/rnelson0/hiera_resources)
[![Puppet Forge Downloads](http://img.shields.io/puppetforge/dt/rnelson0/hiera_resources.svg)](https://forge.puppetlabs.com/rnelson0/hiera_resources)

#### Table of Contents

1. [Overview](#overview)
2. [Beginning with hiera_resources](#beginning-with-hiera_resources)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Credit](#credit)

## Overview

Allow arbitrary definition of resources (classes and defined types) via hiera content while avoiding the hiera_hash/create_resources pattern.

## Beginning with hiera_resources

hiera_resources() allows you to use arbitrary hiera data to create and manage
classes and defined types. Provide a hash with a top level name followed by
a second level resource type and subsequent levels containing the required
resource parameters and values.

For instance, given the following hiera YAML file:

    ---
    messages1:
      notify:
        title 1:
          message: this is the first message stored in YAML
        title 2:
          message: this is the second message stored in YAML

You may include `hiera_resources('messages1')` in a manifest to create two
notify resources, 'title 1' and 'title 2'.

hiera_resources() does not verify the contents of the hash or referenced
resource type. It does accept a second value as a default value if the lookup
fails, following the same tiered hierarchy as the hiera hash.

Title-only or parameter-less resources can be created by leaving a dangling colon or an empty hash (`{}`). For example:

    ----
    title-only:
      notify:
        Title and message:
        Title and message with empty hash: {}

## Usage

Ensure that hiera_resources is in your `$modulepath` and that `pluginsync` is
set to true on the master. You may then use hiera_resources() in your
manifests.

## Credits

This version of hiera_resources is based on
[this excellent blog post](http://blog.yo61.com/assigning-resources-to-nodes-with-hiera-in-puppet/)
by Robin Bowes and a subsequent
[refactoring](https://github.com/reliantsecurity/hiera-resources).

Contributions from:

* [Sascha Spreitzer](https://github.com/sspreitzer)
* [Shane Madden](https://github.com/shanemadden)
