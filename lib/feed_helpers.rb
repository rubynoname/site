# encoding: utf-8
require 'mp3info'

module FeedHelpers
  def feed_data
    {
      :title => "Ruby NoName podcast",
      :description => "Серия русскоязычных подкастов о языке Ruby",
      :author => "Иван Самсонов и Инван Евтухович",
      :owner => {:author => "Иван Самсонов и Иван Евтухович", :email => "evtuhovich@gmail.com"},
      :contentType => {:term => "Podcast", :label => "Подкаст"},
      :categories => {"Technology" => ["Podcasting", "Tech News"]},
      :image => "#{site_url}/images/rnp.jpg"
    }
  end

  def episode_data
    {
      :subtitle => "poscast.name = nil",
      :image => "#{site_url}/images/rnp.jpg"
      :keywords => "Ruby, NoName"
    }
  end
  
  def site_url
    % localhost:4567
  end

  def get_mp3_filename(article_title)
    article_title.split(" ").last + ".mp3"
  end

  def get_audio_duration(path)
    Mp3Info.open(path, :parse_tags => false) { |file| file.length }
  end

  def get_audio_size(path)
    File.size(path)
  end
end