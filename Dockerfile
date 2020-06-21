FROM ubuntu:latest  

LABEL version="1.1.0"
LABEL repository="https://github.com/w9jds/firebase-action"
LABEL homepage="https://github.com/w9jds/firebase-action"
LABEL maintainer="Jeremy Shore <w9jds@github.com>"

LABEL com.github.actions.name="GitHub Action for Firebase"
LABEL com.github.actions.description="Wraps the firebase-tools CLI to enable common commands."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="gray-dark"

RUN apt-get update  
RUN apt-get update && apt-get install -y tzdata
# timezone setting
ENV TZ=Asia/Tokyo 
# Install Node.js and npm  
RUN apt-get install -y nodejs npm  

RUN npm install -g firebase-tools

COPY LICENSE README.md /
COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]
