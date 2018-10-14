sudo apt-get install libczmq-dev -y

git clone https://github.com/fredokun/cl-jupyter
cd cl-jupyter

python ./install-cl-jupyter.py
sbcl --load ./cl-jupyter.lisp


