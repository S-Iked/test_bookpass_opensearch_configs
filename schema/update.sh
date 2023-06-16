#!/bin/sh

HOST="localhost"
PORT=9200

VER="v1"

curl -H'Content-Type: application/json' -XPUT http://$HOST:9200/search_${VER} -d @mapping_search.json
curl -H'Content-Type: application/json' -XPUT http://$HOST:9200/suggest_${VER} -d @mapping_suggest.json
curl -H'Content-Type: application/json' -XPUT http://$HOST:9200/suggest_cn_${VER} -d @mapping_suggest_cn.json
curl -H'Content-Type: application/json' -XPUT http://$HOST:9200/recommend_item_${VER} -d @mapping_recommend.json

curl -H'Content-Type: application/json' -XPUT http://$HOST:9200/query_category_boost_master_${VER} -d @mapping_query_category_boost_master.json
curl -H'Content-Type: application/json' -XPUT http://$HOST:9200/query_rewrite_master_${VER} -d @mapping_query_rewrite_master.json

