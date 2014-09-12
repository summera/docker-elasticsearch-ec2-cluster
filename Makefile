build:
	docker build -t adgenomics/elasticsearch .

run:
	docker run -d -p 9300:9300 -p 9200:9200 --volumes-from es-data --name elasticsearch -e AWS_ACCESS_KEY=${AWS_ACCESS_KEY} -e AWS_SECRET_KEY=${AWS_SECRET_KEY} adgenomics/elasticsearch

data:
	docker run -v $(DATA_LOCATION):/data --name es-data busybox true

shell:
	docker run -i -t --name shell-elasticsearch adgenomics/elasticsearch /bin/bash

clean:
	docker rm -f shell-elasticsearch elasticsearch

