# encoding: utf-8
xml.instruct! :xml, version: "1.0"

xml.rss "xmlns:itunes" => "http://www.itunes.com/dtds/podcast-1.0.dtd", :version => "2.0" do

  xml.channel do
    ### Common information ###
    xml.title feed_data[:title]
    xml.link site_url
    xml.language "ru-RU"
    xml.description feed_data[:description]
    xml.image do |img|
      img.url feed_data[:image]
      img.title feed_data[:title]
      img.link site_url + '/'
      img.width 100
      img.height 100
    end
    xml.itunes :author, feed_data[:author]
    xml.itunes :owner do
      xml.itunes :name, feed_data[:owner][:author]
      xml.itunes :email, feed_data[:owner][:email]
    end
    xml.itunes :image, {:href => feed_data[:image]}
    xml.itunes :link, {:rel => "image", :type => "video/png", :href => feed_data[:image]} do
      feed_data[:title]
    end
    xml.itunes :explicit, feed_data[:explicit]

    ### Categories ###
    feed_data[:categories].each do |category|
      xml.itunes :category, { :text => category[0] } do
        category[1].map {|subcategory| xml.itunes :category, {:text => subcategory} }
      end
    end

    ### Episodes ###
    blog.articles[0..49].each do |article|

      xml.item do
        xml.title  article.title
        xml.description  article.body
        xml.itunes :image, {:href => feed_data[:image]}
        xml.itunes :subtitle, article.data.subtitle || episode_data[:subtitle]
        xml.itunes :author,   article.data.author   || feed_data[:author]
        xml.itunes :keywords, article.data.keywords || episode_data[:keywords]

        xml.itunes :image, { :href => article.data.image || episode_data[:image] }

        xml.itunes :duration, get_audio_duration(get_mp3_filename(article.title))
          xml.enclosure({
            :url => "#{site_url}/mp3/#{get_mp3_filename(article.title)}",
            :length => get_audio_size(get_mp3_filename(article.title)),
            :type => "audio/mpeg"
          })

        xml.pubDate article.date.to_s(:rfc822)
        xml.guid "#{site_url}/mp3/#{get_mp3_filename(article.title)}"
      end # item

    end # blog.articles.each

  end # channel

end
