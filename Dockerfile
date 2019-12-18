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

CMD ["bash", "runner.sh"]
