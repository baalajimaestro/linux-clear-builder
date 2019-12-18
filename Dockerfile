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
                      modutils > /dev/null

RUN useradd runner --create-home

USER runner
WORKDIR /home/runner
COPY runner.sh /home/runner/runner.sh

CMD ["bash", "runner.sh"]
