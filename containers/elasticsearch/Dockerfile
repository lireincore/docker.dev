FROM elasticsearch:7.5.2

COPY --chown=1000:0 conf/analysis/synonym.txt config/analysis/

#RUN elasticsearch-plugin install "https://bintray.com/evo/elasticsearch/download_file?file_path=analysis-jmorphy2-0.2.1-es7.4.2.zip"
#RUN elasticsearch-plugin install http://dl.bintray.com/content/imotov/elasticsearch-plugins/org/elasticsearch/elasticsearch-analysis-morphology/5.6.5/elasticsearch-analysis-morphology-5.6.5.zip