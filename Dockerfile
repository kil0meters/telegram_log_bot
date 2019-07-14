FROM ubuntu:bionic

RUN apt-get update && apt-get install -y curl

WORKDIR /app
COPY bot.sh /app

ENV BOT_TOKEN ""
ENV CHAT_ID "" 

CMD ["/bin/bash", "bot.sh"]
