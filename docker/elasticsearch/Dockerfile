FROM elasticsearch:2.3.5

RUN /usr/share/elasticsearch/bin/plugin install --batch https://maven.atlassian.com/content/groups/public/com/atlassian/elasticsearch/buckler-plugin/0.2.12/buckler-plugin-0.2.12-2.3.5.zip?_ga=2.125723530.1864937751.1503707411-2100088074.1501064668 && \
mkdir /usr/share/elasticsearch/config/buckler
COPY elasticsearch.yml /usr/share/elasticsearch/config/