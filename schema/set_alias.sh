#!/bin/sh                                                                                                                                                       
HOST=$1

if [ "$HOST" == "" ];then
  HOST="localhost"
fi

echo "host: $HOST"

curl -H'Content-Type: application/json' -XPOST "http://$HOST:9200/_aliases" -d "
{
    \"actions\" : [
       { \"add\" : { \"index\" : \"search_v1\", \"alias\" : \"search\" } },
       { \"add\" : { \"index\" : \"search_v1\", \"alias\" : \"bookpass_search\" } },
       { \"add\" : { \"index\" : \"suggest_v1\", \"alias\" : \"suggest\" } },
       { \"add\" : { \"index\" : \"suggest_cn_v1\", \"alias\" : \"suggest_cn\" } },
       { \"add\" : { \"index\" : \"search_stg_v1\", \"alias\" : \"search_stg\" } },
       { \"add\" : { \"index\" : \"suggest_stg_v1\", \"alias\" : \"suggest_stg\" } },
       { \"add\" : { \"index\" : \"suggest_cn_stg_v1\", \"alias\" : \"suggest_cn_stg\" } },
       { \"add\" : { \"index\" : \"search_dev_v1\", \"alias\" : \"search_dev\" } },
       { \"add\" : { \"index\" : \"suggest_dev_v1\", \"alias\" : \"suggest_dev\" } },
       { \"add\" : { \"index\" : \"suggest_cn_dev_v1\", \"alias\" : \"suggest_cn_dev\" } }
    ]
}
"
