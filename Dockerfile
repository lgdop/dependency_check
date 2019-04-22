FROM lgdop/centos6_python2.7.14:git-2.19.1

WORKDIR /clarify_dc
ENV https_proxy=http://172.23.29.155:3128
ENV http_proxy=http://172.23.29.155:3128
RUN virtualenv my27project && source my27project/bin/activate && python --version
RUN pip2.7 install pymongo \
                flask \
                gunicorn \
                hvac
COPY . .
EXPOSE 3010

CMD [ "gunicorn", "--bind", "0.0.0.0:3010", "dc:app" ]
