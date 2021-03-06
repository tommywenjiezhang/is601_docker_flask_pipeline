#Grab the latest alpine image
FROM alpine:latest

# Install python and pip
RUN apk add --no-cache --update build-base python3-dev python3 py3-pip bash  
RUN apk add jpeg-dev zlib-dev 
ENV LIBRARY_PATH=/lib:/usr/lib
ADD ./requirements.txt /tmp/requirements.txt

# Install dependencies
RUN pip3 install --no-cache-dir -q -r /tmp/requirements.txt

# Add our code
ADD ./src /opt/webapp/
WORKDIR /opt/webapp

# Expose is NOT supported by Heroku
# EXPOSE 5000 		

# Run the image as a non-root user
RUN adduser -D myuser
USER myuser

# Run the app.  CMD is required to run on Heroku
# $PORT is set by Heroku			
CMD gunicorn --bind 0.0.0.0:$PORT wsgi 

