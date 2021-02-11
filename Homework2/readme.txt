Setup hw2 Environment using Docker:
> docker pull ntuca2020/hw2 (may require sudo on Linux)
> docker run --name=test -it ntuca2020/hw2

Docker basic usage:

  start container:
  > docker start test
  enter container:
  > docker start test

  file transfer:
    from local to docker:
    > docker cp ./code/Problems/folder/file.s test:/root/Problems/folder/file.s
    from docker to local:
    > docker cp test:/root/Problems/folder/file.s ./code/Problems/folder/file.s

    example:
    > docker cp ./code/Problems/convert/convert.s test:/root/Problems/convert/convert.s
    > docker cp test:/root/Problems/convert/convert.s ./code/Problems/convert/convert.s