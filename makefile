py2:
	docker build -t cagrisofu/jupyter2 -f python2/Dockerfile .

py3:
	docker build -t cagrisofu/jupyter3 -f python3/Dockerfile .

cloud3:
	docker build -t cagrisofu/jupyter3-cloud -f cloud3/Dockerfile .


