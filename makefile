.PHONY: py2 py3 jpylab3

py2:
	docker build -t cagrisofu/jupyter2 -f python2/Dockerfile .

py3:
	docker build -t cagrisofu/jupyter3 -f python3/Dockerfile .

jpylab3:
	docker build -t cagrisofu/jpylab3 -f jpylab3/Dockerfile .

