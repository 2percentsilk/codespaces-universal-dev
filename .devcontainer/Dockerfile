# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.153.0/containers/codespaces-linux/.devcontainer/base.Dockerfile

FROM mcr.microsoft.com/vscode/devcontainers/universal:1-focal

ENV PATH="${ORIGINAL_PATH}:${NVM_DIR}/current/bin:${NPM_GLOBAL}/bin:${DOTNET_ROOT}:${DOTNET_ROOT}/tools:${SDKMAN_DIR}/bin:${SDKMAN_DIR}/candidates/gradle/current/bin:${SDKMAN_DIR}/java/current/bin:/opt/maven/lts:${CARGO_HOME}/bin:${GOROOT}/bin:${GOPATH}/bin:${PIPX_BIN_DIR}:/opt/conda/condabin:/opt/oryx:/opt/nodejs/current/bin:/opt/dotnet/current:/opt/python/current/bin:/opt/php/current/bin:/opt/php-composer:/opt/yarn/current/bin:/opt/hugo/current:/opt/java/current/bin:/opt/maven/current/bin:/opt/ruby/current/bin"

COPY ./oryx-env /usr/local/bin/
RUN sudo bash -c "chmod +x /usr/local/bin/oryx-env \
    && ln -s /opt/nodejs/lts /opt/nodejs/current \
    && ln -s /opt/dotnet/lts /opt/dotnet/current \
    && ln -s /opt/python/latest /opt/python/current \
    && ln -s /opt/php/lts /opt/php/current \
    && ln -s /opt/hugo/lts /opt/hugo/current \
    && ln -s /opt/java/lts /opt/java/current \
    && ln -s /opt/ruby/lts /opt/ruby/current \
    && ln -s /opt/yarn/stable /opt/yarn/current \
    && ln -s /opt/maven/lts /opt/maven/current"
