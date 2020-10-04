FROM exoplatform/ci:jdk8-gradle6-android
USER root
ENV GOOGLE_PLAY_EXO_KEYSTORE_PROPS /srv/ciagent/workspace/keystore.properties
WORKDIR /src
RUN apt-get update
RUN apt-get install -y ruby ruby-dev gem build-essential less vim curl libcurl3-dev libcurl3-dev imagemagick librsvg2-bin
RUN apt-add-repository ppa:brightbox/ruby-ng -y
RUN apt-get update
RUN apt-get install ruby2.4 ruby2.4-dev -y
RUN gem install bundler:1.16.1
RUN gem install fastlane -NV
ENTRYPOINT [ "/usr/local/bin/fastlane"]