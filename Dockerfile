FROM registry.fedoraproject.org/fedora-minimal:44

RUN useradd --system --uid 999 --user-group --home-dir /var/cache/debuginfod/ --shell /usr/sbin/nologin debuginfod

RUN dnf5 update -y
RUN dnf5 install elfutils-debuginfod -y

RUN dnf5 clean all
RUN rm -rf /var/cache/{dnf,yum}

USER debuginfod
VOLUME [ "/var/cache/debuginfod/" ]
ENTRYPOINT [ "debuginfod" ]
