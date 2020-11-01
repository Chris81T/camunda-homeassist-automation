#!/bin/bash

echo "Clean up target/container-build..."
rm -rf target/container-build
mkdir target/container-build

echo "Build camunda-homeassist-automation... (ATTENTION: For prototype impl. tests are skipped!)"
mvn install -f ./pom.xml -DskipTests=true

echo "Copy Dockerfile to target/container-build..."
cp ./Dockerfile target/container-build/

echo "Copy camunda-homeassist-automation to target/container-build..."
cp target/camunda-homeassist-automation-0.0.7-SNAPSHOT.jar target/container-build/

echo "Build Docker image"
docker build -f ./target/container-build/Dockerfile -t camunda-homeassist-automation .

echo "Export generated Docker image to to target..."
docker save camunda-homeassist-automation:latest > target/container-build/camunda-homeassist-automation.tar

echo "Building docker image 'camunda-homeassist-automation' finished. Go to target/container-build to find it."
