FROM registry.fedoraproject.org/fedora-minimal:39

RUN dnf5 update -y
RUN dnf5 install elfutils-debuginfod -y

RUN dnf5 clean all
RUN rm -rf /var/cache/{dnf,yum}

ENTRYPOINT [ "debuginfod" ]
