FROM jupyter/base-notebook:latest
USER root
RUN apt-get update
RUN apt-get install -y libtool \
  libffi-dev \
  ruby \
  ruby-dev \
  make \
  libzmq3-dev \
  libczmq-dev
RUN gem install --no-ri --no-rdoc ffi-rzmq \
  pry \
  iruby \
  dry-struct
COPY --chown=1001:1000 dry_struct_introduction.ipynb ./
RUN chmod -w dry_struct_introduction.ipynb
USER jovyan
RUN iruby register --force
