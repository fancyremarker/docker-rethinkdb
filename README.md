# ![](https://gravatar.com/avatar/11d3bc4c3163e3d238d558d5c9d98efe?s=64) aptible/rethinkdb
[![Docker Repository on Quay.io](https://quay.io/repository/aptible/rethinkdb/status)](https://quay.io/repository/aptible/rethinkdb)

[![](http://dockeri.co/image/aptible/rethinkdb)](https://registry.hub.docker.com/u/aptible/rethinkdb/)

RethinkDB on Docker

## Installation and Usage

    docker pull quay.io/aptible/rethinkdb

This is an image conforming to the [Aptible database specification](https://support.aptible.com/topics/paas/deploy-custom-database/). To run a server for development purposes, execute

    docker create --name data quay.io/aptible/rethinkdb
    docker run --volumes-from data -e PASSPHRASE=pass quay.io/aptible/rethinkdb --initialize
    docker run --volumes-from data -P quay.io/aptible/rethinkdb

The first command sets up a data container named `data` which will hold the configuration and data for the database. The second command creates a RethinkDB instance with the passphrase of your choice. The third command starts the database server.

## Available Tags

* `latest`: Currently RethinkDB 2.0.4
* `2.0`: RethinkDB 2.0.4

## Tests

Tests are run as part of the `Dockerfile` build. To execute them separately within a container, run:

    bats test

## Continuous Integration

Images are built and pushed to Docker Hub on every deploy. Because Quay currently only supports build triggers where the Docker tag name exactly matches a GitHub branch/tag name, we must run the following script to synchronize all our remote branches after a merge to master:

    make sync-branches

## Deployment

To push the Docker image to Quay, run the following command:

    make release

## Copyright and License

MIT License, see [LICENSE](LICENSE.md) for details.

Copyright (c) 2015 [Aptible](https://www.aptible.com) and contributors.

[<img src="https://s.gravatar.com/avatar/f7790b867ae619ae0496460aa28c5861?s=60" style="border-radius: 50%;" alt="@fancyremarker" />](https://github.com/fancyremarker)
