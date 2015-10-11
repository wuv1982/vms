#!/bin/bash
docker run -d --name ddb oasis/dev:0.1 /bin/bash
docker run -d --name rdb oasis/dev:0.1 /bin/bash
docker run -t -t --name web --link ddb:mongo --link rdb:postgre oasis/dev:0.1
