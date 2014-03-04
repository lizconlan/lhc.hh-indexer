lhc.hh-indexer
==============

Search indexing thing that uses a compatible structure to the search on the
[Large Hansard Collider](https://github.com/lizconlan/large-hansard-collider).
Churns through the Historic Hansard database and throws things clumsily
into 2 indices - one for Lords and one for Commons.

## Oddities

Deliberately doesn't build the database as it assumes that the database has 
already been created and populated. Not including the database here, it's
huge.

## Assumptions

* Ruby 2.0.x
* Postgres 9.3.x
* Elasticsearch 1.0.x
