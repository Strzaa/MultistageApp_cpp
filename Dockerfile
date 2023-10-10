#BUILD
FROM alpine as builder

#Update
RUN apk update && apk upgrade

#Install essencial packages to build
RUN apk add -i \
	g++ \
	cmake \
	make

#Copy progrm dir to container
COPY program .

#Make build dir
RUN mkdir build

#Make build files to ./build and build the app
RUN cmake -B ./build -S . -D CMAKE_BUILD_TYPE=Release
RUN cmake --build ./build 

#RUN
FROM alpine

#Update
RUN apk update && apk upgrade

#Install esencial package to run
RUN apk add --no-cache libstdc++

#Copy run files from BUILD
COPY --from=builder ./build/cppdocker_run .

CMD ["./cppdocker_run"]

#CMD ["sleep","infinity"]

