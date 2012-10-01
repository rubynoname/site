xml.instruct! :xml, version: "1.0"

xml.rss version: "2.0" do
  xml.channel do
    xml.title feed_data[:title]
    xml.link site_url
    xml.description feed_data[:description]

    blog.articles.each do |article|
      xml.item do
        xml.title article.title
        xml.description article.body
        xml.pubDate article.date.to_s(:rfc822)
        xml.link site_url + article.url
        xml.guid site_url + article.url
      end
    end

  end
end
