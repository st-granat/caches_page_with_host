require "caches_page_with_host/engine"
require "caches_page_with_host/version"

module CachesPageWithHost
  module ClassMethods
    def page_cache_file(path, extension)
      name = if path.empty?
        "/index"
      elsif path.end_with?("/")
        "#{path}index"
      else
        URI.parser.unescape(path.chomp('/'))
      end
      unless (name.split('/').last || name).include? '.'
        name << (extension || self.page_cache_extension)
      end
      return name
    end
  end

  module InstanceMethods
    def cache_page(content = nil, options = nil, gzip = Zlib::BEST_COMPRESSION)
      return unless self.class.perform_caching && caching_allowed?
      path = "/#{request.host}"
      path << case options
        when Hash
          url_for(options.merge(:only_path => true, :format => params[:format]))
        when String
          options
        else
          # request.path do not contain trailing slash at the end of path,
          # but request.env['REQUEST_URI'] does contain trailing slash
          URI(request.env['REQUEST_URI']).path
      end
      if (type = Mime::LOOKUP[self.content_type]) && (type_symbol = type.symbol).present?
        extension = ".#{type_symbol}"
      end
      self.class.cache_page(content || response.body, path, extension, gzip)
    end
  end
end
