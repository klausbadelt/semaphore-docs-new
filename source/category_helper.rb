require_relative "categories/getting_started"
require_relative "categories/language_support"
require_relative "categories/database_support"
require_relative "categories/docker_support"
require_relative "categories/semaphore_platform"
require_relative "categories/git_services"
require_relative "categories/build_customization"
require_relative "categories/adapting_semaphore"
require_relative "categories/managing_dependencies"

def category_options
  case current_page.data.category
  when GETTING_STARTED_KEY then GETTING_STARTED_OPTIONS
  when LANGUAGE_SUPPORT_KEY, *LANGUAGE_SUPPORT_SUBCATEGORIES then LANGUAGE_SUPPORT_OPTIONS
  when DATABASE_SUPPORT_KEY then DATABASE_SUPPORT_OPTIONS
  when DOCKER_SUPPORT_KEY then DOCKER_SUPPORT_OPTIONS
  when SEMAPHORE_PLATFORM_KEY then SEMAPHORE_PLATFORM_OPTIONS
  when GIT_SERVICES_KEY then GIT_SERVICES_OPTIONS
  when BUILD_CUSTOMIZATION_KEY then BUILD_CUSTOMIZATION_OPTIONS
  when ADAPTING_SEMAPHORE_KEY then ADAPTING_SEMAPHORE_OPTIONS
  when MANAGING_DEPENDENCIES_KEY then MANAGING_DEPENDENCIES_OPTIONS
  else []
  end
end
