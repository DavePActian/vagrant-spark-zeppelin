#!/usr/bin/env bash
set -e


sudo apt-get install dos2unix

# Running Install Scripts
SCRIPTS=$(find /vagrant/install/install-* -type f)

for SCRIPT in ${SCRIPTS}; do
  echo
  echo
  echo
  echo "--------------------------------------------"
  SCRIPT_NAME=$(basename ${SCRIPT})
  echo "Running ... ${SCRIPT_NAME}"
  
  dos2unix ${SCRIPT}
  sudo "${SCRIPT}"
  
  echo "Finished ... ${SCRIPT_NAME}"
  echo "--------------------------------------------"
done
