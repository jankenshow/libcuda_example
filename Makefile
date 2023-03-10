all: clean build install

build: clean
	mkdir build && cd build && cmake ../ && make

install:
	cd build && make install

.PHONY: clean
clean:
	rm -rf build install

run:
	./build/run