FROM gcc AS compilation

WORKDIR /src

COPY prog.c .

RUN gcc -o prog prog.c



FROM debian:13

COPY --from=compilation /src/prog /usr/bin

CMD [ "/usr/bin/prog" ]