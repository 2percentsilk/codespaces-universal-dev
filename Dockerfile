#FROM mcr.microsoft.com/vscode/devcontainers/universal:0.15.0
FROM debian:10

ENV TEST_VARIABLE_HERE=true
ENV PATH=${PATH}:/some/random/path
