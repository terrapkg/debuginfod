FROM registry.fedoraproject.org/fedora:39

RUN dnf update -y
RUN dnf install elfutils-debuginfod -y

RUN dnf clean all
RUN rm -rf /var/cache/{dnf,yum}

ENTRYPOINT [ "debuginfod" ]
