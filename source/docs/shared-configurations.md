---
layout: post
title: Sharing build configuration between teams and projects
category: Customizing your build
---

Every project can be configured by adding
[environment variables](http://semaphoreci.com/docs/exporting-environment-variables.html) and
[configuration files](http://semaphoreci.com/docs/adding-custom-configuration-files.html)
in the project's setup.

If you want to share environment variables and configuration files between two
or more projects, your organization can set up a shared configuration set and
attach it to multiple projects in your organization.

For example, if you have have a set of environment variables (`AWS_ACCESS_KEY_ID`,
`AWS_SECRET_ACCESS_KEY`) for accessing a your resources on AWS, you can create a
shared configuration called `AWS Access Keys`.

To use entries from the shared configuration, you need to add it to your teams
and to attach it to your project.

### Adding shared configurations to your teams

When created, a shared configuration is added only to the owners team, and only
owners can attach them to projects. To allow non-owner users to use the shared
configuration, you need to add the shared configuration to their teams.

### Attach shared configuration to your projects

To use the entries in the shared configuration in your projects, you need to
attach the shared configuration to your project, and select the environment
variables you want to use from the shared configuration.

## Setting up a shared configuration via APIv2

The management of Shared Configurations is only available through our
[API v2](docs/api_v2_overview.html).

Let's set up and example shared configuration called `AWS Tokens` with
`AWS_ACCESS_KEY_ID` environment variable, add it to a team, and attach
it to a project.

First, let's [create](http://semaphoreci.com/docs/api_v2_shared_configs.html)
the shared configuration:

``` bash
curl \
  -X POST \
  -H "Authorization: Token ${AUTH_TOKEN}" \
  -d '{"name":"Tokens"}' \
  "https://api.semaphoreci.com/v2/orgs/${ORG_USERNAME}/shared_configs"
```

Next, it's time to
[add an environment variable](http://semaphoreci.com/docs/api_v2_env_vars.html)
to the configuration:

``` bash
curl \
  -X POST \
  -H "Authorization: Token ${AUTH_TOKEN}" \
  -d '{"name":"AWS_ACCESS_KEY_ID","content":"dkfalsdhfalsdfadsfa"}' \
  "https://api.semaphoreci.com/v2/shared_configs/${SHARED_CONFIG_ID}/env_vars"
```

Before she can use the configuration in projects, an admin in the organization
should [add](http://semaphoreci.com/docs/api_v2_shared_configs.html) it to one of her teams:

``` bash
curl \
  -X POST \
  -H "Authorization: Token ${AUTH_TOKEN}" \
  "https://api.semaphoreci.com/v2/teams/${TEAM_ID}/shared_configs/${SHARED_CONFIG_ID}"
```

A member of the team can [attach the configuration to a project](http://semaphoreci.com/docs/api_v2_shared_configs.html),
therefore making its contents available for use when configuring the project.
Here's how:

``` bash
curl \
  -X POST \
  -H "Authorization: Token ${AUTH_TOKEN}" \
  "https://api.semaphoreci.com/v2/projects/${PROJECT_ID}/shared_configs/${SHARED_CONFIG_ID}"
```

Now, any collaborator can [connect the environment variable to the project](http://semaphoreci.com/docs/api_v2_shared_configs.html):

``` bash
curl \
  -X POST \
  -H "Authorization: Token ${AUTH_TOKEN}" \
  "https://api.semaphoreci.com/v2/projects/${PROJECT_ID}/env_vars/${ENV_VAR_ID}"
```

`AWS_ACCESS_KEY_ID` should now be listed in our environment variables list:

<p class="figure">
  > <%= image_tag image_url("screenshot") %>
</p>

From now on, every build will contain the `AWS_ACCESS_KEY_ID`. Also, if our
admin were to update the value of the token, the change would propagate to
this project.
