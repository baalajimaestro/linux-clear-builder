FROM opensuse/tumbleweed:latest

RUN zypper install -y git \
                      pesign-obs-integration \
                      flex \
                      kernel-devel \
                      libopenssl-devel \
                      rpm-build \
                      rpmdevtools \
                      sudo \
                      wget \
                      bc \
                      bison \
                      fdupes \
                      hmaccalc \
                      libelf-devel \
                      modutils

RUN useradd runner --create-home

USER runner
WORKDIR /home/runner

RUN git clone https://github.com/baalajimaestro/linux-clear --depth=1 kernel-source
RUN cd kernel-source/ && scripts/install-git-hooks && curl -o linux-5.4.tar.xz http://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.4.tar.xz && scripts/tar-up.sh
RUN rpmdev-setuptree
RUN cp ~/kernel-source/config/x86_64/default /boot/$L
RUN rm -rf ~/rpmbuild/SOURCES
RUN mv ~/kernel-source/kernel-source ~/rpmbuild/SOURCES
RUN cd ~/rpmbuild/SOURCES/ && yes | rpmbuild -bb kernel-default.spec
CMD ["bash"]
