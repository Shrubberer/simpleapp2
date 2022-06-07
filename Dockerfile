FROM centos
MAINTAINER Markos <mail@mail.com>

# Add repo file
#ADD ./sander.repo /etc/yum.repos.d/

# CentOS8 problems fix
RUN dnf -y --disablerepo '*' --enablerepo=extras swap centos-linux-repos centos-stream-repos &&\
    dnf -y distro-sync
# Install cool software
RUN yum --assumeyes update && \
yum --assumeyes install \
nmap iproute && \
bash && \
yum clean all

ENTRYPOINT ["/usr/bin/nmap"]
CMD ["-sn", "localhost"] 
