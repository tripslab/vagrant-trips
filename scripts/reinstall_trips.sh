rm -rf shared/step
git clone https://github.com/wdebeaum/step shared/step

vagrant up --provision-with trips-dependencies,trips-configure
