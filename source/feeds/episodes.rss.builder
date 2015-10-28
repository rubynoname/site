# encoding: utf-8
xml.instruct! :xml, version: "1.0"

xml.rss version: "2.0" do
  xml.channel do
    xml.title feed_data[:title]
    xml.link site_url
    xml.description feed_data[:description]

    blog.articles[0..49].each do |article|
      xml.item do
        xml.title article.title
        xml.description article.body
        xml.pubDate article.date.to_s(:rfc822)
        xml.link "#{site_url}#{article.url}"
        xml.guid "#{site_url}#{article.url}"
        xml.enclosure({
          :url => "#{site_url}/mp3/#{get_mp3_filename(article.title)}",
          :length => get_audio_size(get_mp3_filename(article.title)),
          :type => "audio/mpeg"
        })
      end
    end

  end
end
