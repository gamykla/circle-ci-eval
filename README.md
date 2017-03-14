# circle-ci-eval
Trying out circleci.com

Q & A
=========
- how can we create artifacts?
>>> https://circleci.com/docs/1.0/build-artifacts/

- are build artifacts immutable? i.e. can someone alter or delete them after the fact?
>>> user doesn't appear able to delete build artifacts or builds themselves.

- How can we do stuff in parallel?

- what does the stages model look like?

- can we add our own runners?

- How do we keep secrets?
>>> at the project level: https://circleci.com/docs/1.0/environment-variables/#setting-environment-variables-for-all-commands-without-adding-them-to-git
>>> https://circleci.com/gh/jelis/circle-ci-eval/edit
>>> https://circleci.com/gh/jelis/circle-ci-eval/edit#env-vars
>>> not super secure

- how can you limit who has access to secrets?

- deploying to docker registry
>>> https://circleci.com/docs/1.0/docker/#deployment-to-a-docker-registry

- how do we use a different version of docker?
>>> No clear way to do so. You're stuck with the versions they support documented here: https://circleci.com/docs/1.0/docker/#version-support

- are there different roles with different capabilities?

- is there a way to manage different deployment environments?

- pricing??
>>> https://circleci.com/pricing/#build-linux

NB
=======
- circle feels like its well made. The UI is pleasant and appears to be bug free (unlike gitlab)
- the design aesthetics are good
- circle gives you the ability to ssh into build runners to debug... 

