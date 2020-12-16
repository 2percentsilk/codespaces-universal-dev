# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.153.0/containers/codespaces-linux/.devcontainer/base.Dockerfile

FROM mcr.microsoft.com/vscode/devcontainers/universal:1-focal

ENV PATH="${ORIGINAL_PATH}:${NVM_DIR}/current/bin:${NPM_GLOBAL}/bin:${DOTNET_ROOT}:${DOTNET_ROOT}/tools:${SDKMAN_DIR}/bin:${SDKMAN_DIR}/candidates/gradle/current/bin:${SDKMAN_DIR}/java/current/bin:/opt/maven/lts:${CARGO_HOME}/bin:${GOROOT}/bin:${GOPATH}/bin:${PIPX_BIN_DIR}:/opt/conda/condabin:/opt/oryx:/opt/nodejs/current/bin:/opt/dotnet/current:/opt/python/current/bin:/opt/php/current/bin:/opt/php-composer:/opt/yarn/current/bin:/opt/hugo/current:/opt/java/current/bin:/opt/maven/current/bin:/opt/ruby/current/bin"

COPY ./oryx-env ./original-platform-versions /tmp/
RUN sudo bash -c "\
        # Wire put oryx-env, benv in the right spots as root
        mv /tmp/oryx-env /usr/local/bin/ \
        && chmod +x /usr/local/bin/oryx-env \
        && mv /tmp/original-platform-versions /opt/oryx/ \
        && echo -e 'export PATH=\$(echo \"\${PATH}\" | sed -r 's/\/opt\/[^\/]+\/current\/bin:?//g' | sed -r 's/\/opt\/dotnet\/current:?//g')\n\
            . benv \$(cat /opt/oryx/default-platform-versions | tr \"\n\" \" \") 2>/dev/null' | tee -a /etc/bash.bashrc >> /etc/zsh/zshrc \
        # Work around annoying problem with rvm warnings
        && sed -i -e 's/\/scripts\/rvm/\/scripts\/rvm >\/dev\/null 2>\&1/' /etc/bash.bashrc \
        && sed -i -e 's/\/scripts\/rvm/\/scripts\/rvm >\/dev\/null 2>\&1/' /etc/zsh/zshrc" \
    && /usr/local/bin/oryx-env true reset \
    # Resolve https://github.com/microsoft/vscode-dev-containers/issues/691
    && bash -c "\
        . ${SDKMAN_DIR}/bin/sdkman-init.sh \
        && sdk uninstall java opt-java-lts \
        && sdk uninstall java opt-java-11 \
        && sdk uninstall java 8.0.275.hs-adpt"
