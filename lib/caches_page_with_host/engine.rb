# require "caches_page_with_host"
# require "rails"
# coding: utf-8
module CachesPageWithHost
  class Engine < Rails::Engine
    initializer 'caches_page_with_host.app_controller' do |app|
      ActiveSupport.on_load(:action_controller) do
        extend CachesPageWithHost::ClassMethods
        include CachesPageWithHost::InstanceMethods
      end
    end
  end
end
