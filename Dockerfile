FROM alpine

RUN apk add git neovim gcc g++ bash

CMD ["bash"]
