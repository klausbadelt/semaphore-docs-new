---
layout: post
title: Setting up continuous integration for a Docker project
category: Docker
---

Setting up continuous integration for your project that uses **Docker** and
running your first build on Semaphore is easy and intuitive. Semaphore provides
a quick configuration process for GitHub and Bitbucket repositories, which makes
importing your code straightforward.

If you don't already have a Semaphore account, sign up for a free
account [here](/users/sign_up). The free account provides you with unlimited CI
service for open-source projects and up to 100 private builds per month.

After you have signed in on Semaphore for the first time, a welcome screen will
prompt you to add your first project. Click the "Start a Project" button to get
started.

<img src="/docs/assets/img/adding-new-project/build-new-project.png" class="img-responsive img-bordered" alt="Start a Project">

If you already have some projects on Semaphore, you can add a new project
by clicking on the "Create new" menu in the top navigation bar, and then
selecting "Project".

If this is the first project you're adding to Semaphore, the next screen will
prompt you to connect your Semaphore account with your GitHub or Bitbucket
account. For more information on how that works, please consult our detailed
guide on [adding your GitHub or Bitbucket project to
Semaphore](/docs/adding-github-bitbucket-project-to-semaphore.html).

After you have connected your repository host account with your Semaphore
account, Semaphore will list all the projects it is able to access. You can
select one from the list.

<img src="/docs/assets/img/adding-new-docker-project/select-project.png" class="img-responsive img-bordered" alt="Select project">

Next, select the Git branch you would like to use first. Semaphore will
**automatically** test every new branch you create from the point your project
is created and remove the ones you delete from origin. You can add any branches
that existed before you created the project on Semaphore manually from your
project page.

<img src="/docs/assets/img/adding-new-docker-project/select-branch.png" class="img-responsive img-bordered" alt="Select branch">

After selecting a branch, Semaphore will perform a **quick analysis** of the
source code and recognize the presence of your `Dockerfile` or
`docker-compose.yml`. This will generate a set of working build commands
depending on your project's programming language. You will be able to see and
customize the commands once the analysis is finished.

<img src="/docs/assets/img/adding-new-docker-project/short-analysis.png" class="img-responsive img-bordered" alt="Short analysis">

Next, Semaphore will prompt you to choose a platform for your project based on
the project analysis. If you have `Dockerfile` or `docker-compose.yml` in your
project, Semaphore will preselect the platform with enabled Docker support.
Click on the "Docker" option. You can change the platform later on the project's
settings page.

<img src="/docs/assets/img/adding-new-project/choose-platform-step.png" class="img-responsive img-bordered" alt="Analysis results">

Once you have chosen a platform, you can add your container registry host.
Semaphore supports:

 - [Docker Hub](/docs/docker/continuous-delivery-docker-hub.html),
 - [Amazon EC2 Container Registry (ECR)](/docs/docker/continuous-delivery-aws-container-registry.html),
 - [Google Container Registry (GCR)](/docs/docker/continuous-delivery-google-container-registry.html),
 - [Quay.io](/docs/docker/continuous-delivery-quayio.html),
 - [Custom Container Registry](/docs/docker/continuous-delivery-on-premise-container-registry.html).

This step is optional, so you can click "Skip this step" if you're not using any
of the above mentioned registry hosts.

<img src="/docs/assets/img/adding-new-project/docker-registry-hosts-list.png" class="img-responsive img-bordered" alt="Container Registry Hosts list">

If your project needs to run commands that are different from what Semaphore has
suggested, just use the commands editor to customize them for your needs.

At this point, you'll be ready to launch your first **Docker** build. Click on
"Build With These Settings" to launch the build. If all goes well, you should
see your first successful build on Semaphore.

<img src="/docs/assets/img/adding-new-docker-project/green-build.png" class="img-responsive img-bordered">

Happy building!
