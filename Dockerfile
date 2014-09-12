FROM dockerfile/elasticsearch

RUN apt-get update
RUN apt-get -y install wget unzip

# Set ENV vars
ENV ES_CLUSTER_NAME elasticsearch
ENV ES_AWS_REGION us-east-1
ENV ES_SECURITY_GROUP elasticsearch

# Mount elasticsearch.yml config
ADD config/elasticsearch.yml /elasticsearch/config/elasticsearch.yml

RUN mkdir -p /plugins/cloud-aws
WORKDIR /plugins/cloud-aws
RUN wget http://download.elasticsearch.org/elasticsearch/elasticsearch-cloud-aws/elasticsearch-cloud-aws-2.3.0.zip
RUN unzip /plugins/cloud-aws/elasticsearch-cloud-aws-2.3.0.zip 
RUN rm /plugins/cloud-aws/elasticsearch-cloud-aws-2.3.0.zip

WORKDIR /data
