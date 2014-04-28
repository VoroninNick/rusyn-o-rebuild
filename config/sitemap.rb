# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.example.com"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end

  add '/home', :changefreq => 'weekly', :priority => 4
  add '/about', :changefreq => 'monthly', :priority => 4
  add '/catalog', :changefreq => 'monthly', :priority => 4
    Catalog4::Category.where('parent_category_id is null').each do |category|
      add '/catalog/'+category.category_url, :changefreq => 'weekly', :priority => 4
    end
    add '/catalog/colors', :changefreq => 'monthly', :priority => 4
    add '/catalog/poslugi-z-blagoustroyu', :changefreq => 'monthly', :priority => 4

  add '/articles', :changefreq => 'monthly', :priority => 4
  add '/gallery', :changefreq => 'monthly', :priority => 4
  add '/contact', :changefreq => 'never', :priority => 4
end
