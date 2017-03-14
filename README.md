# circle-ci-eval
Trying out circleci.com

Q & A
=========
- how can we create artifacts?
>>> https://circleci.com/docs/1.0/build-artifacts/
>>> during the build just copy files into the $CIRCLE_ARTIFACTS directory and they'll be "collected" and attached to the build.

- are build artifacts immutable? i.e. can someone alter or delete them after the fact?
>>> user doesn't appear able to delete build artifacts or builds themselves.

- How can we do stuff in parallel?
>>> can be set up manually https://circleci.com/docs/1.0/parallel-manual-setup/ need to set a parallel: true flag on 'test'. a subset of tests will be run on a set of VMs.. Not completely trivial but doable. Should speed up test time.
>>> gitlab pipelines give you more control over parallelism being able to run multiple jobs in each stage. The pipeline with gitlab is fully configurable and can be used to model pipelines of arbitrary complexity. far more flexibility with gitlab. this is a bit more rudimentary, building ontop of the capabilities of a system like travis.

- what does the stages model look like?
>>> basically it's about setting up the machine, compiling, running tests, deploying. it's not as flexible as what gitlab gives you.

- can we add our own runners?
>>> nope.. can probably host them on-prem tho with the enterprise offering

- How do we keep secrets?
>>> at the project level: https://circleci.com/docs/1.0/environment-variables/#setting-environment-variables-for-all-commands-without-adding-them-to-git
>>> https://circleci.com/gh/jelis/circle-ci-eval/edit
>>> https://circleci.com/gh/jelis/circle-ci-eval/edit#env-vars
>>> not super secure -- would be nice if you could add your own runners that operations could manage which contain some secrets, such as those for deployment etc.

- how can you limit who has access to secrets?
>>> doesn't appear to be different roles

- deploying to docker registry
>>> https://circleci.com/docs/1.0/docker/#deployment-to-a-docker-registry

- how do we use a different version of docker?
>>> No clear way to do so. You're stuck with the versions they support documented here: https://circleci.com/docs/1.0/docker/#version-support

- are there different roles with different capabilities?
>>> nope


- is there a way to manage different deployment environments?
>>> In the deployments section of circleci you can deploy to different environments. you can declare different environments yourself as keys under 'deployment' see https://circleci.com/docs/1.0/configuration/#deployment
>>> you can control which branch is deployed to which environment and can script the deployment.
>>> Doesn't appear to be support for viewing the state of a deployment environment. Can't look at 'prod' and see which build is deployed

- pricing??
>>> https://circleci.com/pricing/#build-linux
>>> bit of an odd pricing model.. you pay for build hosts.
>>> looks like for $1100 USD /month you could run 5 concurrent builds with 4 parallel jobs each

- authentication
>>> via Github, bitbucket. No AD support

NB
=======
- circle feels like its well made. The UI is pleasant and appears to be bug free (unlike gitlab)
- the design aesthetics are good
- circle gives you the ability to ssh into build runners to debug... 
- there is "enterprise" support which allows you to run builds within corp firewall https://circleci.com/pricing/#build-enterprise
- WARNING.. each command in the 'test' section is run in its own isolated environment. setting variables in an earlier command won't allow them to be used in a later command. kind of sucks.
- seems designed for Ruby apps in mind.
- container workflows seem like a bit of an afterthought.

