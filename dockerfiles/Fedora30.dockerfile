# vim: ft=dockerfile

FROM fedora:30

RUN dnf makecache

# Dev dependencies
RUN dnf install -y          \
    git                     \
    rsync                   \
    make                    \
    openssl                 \
    python-sphinx           \
    python3-coverage        \
    python3-devel           \
    python3-distro          \
    python3-future          \
    python3-pep8            \
    python3-pyflakes        \
    python3-pycodestyle     \
    python3-setuptools      \
    python3-sphinx         \
    rpm-build

# Runtime dependencies
RUN yum install -y          \
    httpd                   \
    python3-mod_wsgi        \
    python3-PyYAML          \
    python3-cheetah         \
    python3-netaddr         \
    python3-simplejson      \
    python3-tornado         \
    python3-django          \
    python3-dns             \
    python3-ldap3           \
    python3-pymongo         \
    createrepo              \
    dnf-plugins-core        \
    genisoimage             \
    grub2-efi-ia32-modules  \
    grub2-efi-x64-modules   \
    logrotate               \
    rsync                   \
    syslinux                \
    tftp-server

COPY . /usr/src/cobbler
WORKDIR /usr/src/cobbler

VOLUME /usr/src/cobbler/rpm-build

CMD ["/bin/bash", "-c", "make install && make rpms"]
