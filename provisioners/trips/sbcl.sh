if [[ -n $1 ]] && [[ "$1" = "source" ]]; 
then
	export LISPS_DIR=${HOME}/lisps
	mkdir -p ${LISPS_DIR}/{src,bin}
	pushd ${LISPS_DIR}/src
	
	git clone git://git.code.sf.net/p/sbcl/sbcl sbcl
	sudo apt-get install clisp -y
	pushd sbcl
	export GNUMAKE=make
	./make.sh "clisp"
	sudo ./install.sh
	#SBCL_HOME=${LISPS_DIR}/sbcl/lib/sbcl exec ${LISPS_DIR}/sbcl/bin/sbcl "\$@"
	popd
	sudo apt-get install libczmq-dev -y

	git clone https://github.com/fredokun/cl-jupyter
	cd cl-jupyter

	python ./install-cl-jupyter.py
	sbcl --load ./cl-jupyter.lisp
	cd
else
	apt-get install sbcl
fi

curl -O https://beta.quicklisp.org/quicklisp.lisp
sbcl --load quicklisp.lisp --eval "(quicklisp-quickstart:install)" --quit

cp ~/shared/dotfiles/sbclrc ~/.sbclrc
