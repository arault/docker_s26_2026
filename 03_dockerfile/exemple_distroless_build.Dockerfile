FROM gcc AS compilation

WORKDIR /src

COPY prog.c .

RUN gcc -o prog -static prog.c



FROM scratch

COPY --from=compilation /src/prog /usr/bin

CMD [ "/usr/bin/prog" ]