require 'lib/feed_helpers'
require 'mp3info'
require 'json'

activate :blog do |blog|
  blog.prefix = 'posts'
  blog.permalink = ':year/:title.html'
  blog.paginate = true
  blog.per_page = 3
end

activate :cache_buster
###
# Compass
###

# Susy grids in Compass
# First: gem install susy --pre
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page "/feeds/episodes.rss", :layout => false
page "/feeds/itunes.xml", :layout => false
page "/archive", :proxy => "/archive.html"
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

helpers FeedHelpers
# Methods defined in the helpers block are available in templates

EPISODES_META = JSON.parse(File.read('episodes.json'))

helpers do
  def site_url(protocol = 'http')
    if development?
      "#{protocol}://localhost:4567"
    else
      "#{protocol}://rubynoname.ru"
    end
  end

  def get_mp3_filename(article_title)
    article_title.split(" ").last.downcase + ".mp3"
  end

  def get_audio_duration(path)
    EPISODES_META[path]['duration']
  end

  def get_audio_size(path)
    EPISODES_META[path]['size']
  end

  def get_title(page)
    title = page.title
    if page.is_a? Middleman::Sitemap::Resource
      subtitle = page.data["subtitle"]
    else
      subtitle = page.subtitle
    end

    if subtitle
      title.split(" ").last + " — " + subtitle
    else
      title
    end
  end
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true,
               autolink: true,
               smartypants: true

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end
