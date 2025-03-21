#!/bin/bash
VERSION="$1"
APP="${2}"
DOCKERFILE="${3:-Dockerfile}"

function build_container() {

  if [[ -f ".npmrc" ]];then
    docker build -f "${DOCKERFILE}" -t "${APP}:${VERSION}" . --secret id=npmrc,src=./.npmrc
  else
      docker build -f "${DOCKERFILE}" -t "${APP}:${VERSION}" .
  fi

  if [[ $? -ne 0 ]]; then
      echo "Cannot build docker"
      exit 1
  fi
}

function release_container() {
  docker tag "${APP}:${VERSION}" "${IMAGE_URL}:${VERSION}"
  # shellcheck disable=SC2181
  if [[ $? -ne 0 ]]; then
      echo "Cannot Tag Docker Build with version"
      exit 1
  fi
  docker tag "${APP}:${VERSION}" "${IMAGE_URL}:latest"
  # shellcheck disable=SC2181
  if [[ $? -ne 0 ]]; then
      echo "Cannot Tag Docker Build with latest"
      exit 1
  fi
  docker push "${IMAGE_URL}:${VERSION}"
  # shellcheck disable=SC2181
  if [[ $? -ne 0 ]]; then
      echo "Cannot Push Version Tagged"
      exit 1
  fi
  docker push "${IMAGE_URL}:latest"
  # shellcheck disable=SC2181
  if [[ $? -ne 0 ]]; then
      echo "Cannot Push Latest Tagged"
      exit 1
  fi
}

function create_registry_url() {
  if [[ -z "${IMAGE_URL}" ]];then
    echo "IMAGE_URL is not defined, building"
    export IMAGE_URL="registry.gitlab.com/${GITLAB_PROJECT}/${APP}"
  fi
}

######################## Main

if [[ -z "${APP}" ]]; then
  echo "Usage: ./build.sh ${VERSION} ${CONTAINER_NAME}"
  exit 1
fi

REQUIRED_VARIABLES=( "APP" "VERSION" )
# shellcheck disable=SC2043
HAS_ERROR=0
for REQ in "${REQUIRED_VARIABLES[@]}"
do
  if [[ -z "${REQ}" ]]; then
    echo "Variable ${REQ} is required and does not have a value"
    HAS_ERROR=1
  fi
done

if [[ ${HAS_ERROR} -gt 0 ]]; then
  echo "One or more required variables are not set. Please set and re-run."
  exit 1
fi

create_registry_url
echo "======================="
echo "Building ${IMAGE_URL}"
echo "Version: ${VERSION}"
echo "======================="
build_container
release_container
