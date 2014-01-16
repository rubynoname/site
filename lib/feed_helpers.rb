# encoding: utf-8

module FeedHelpers
  def feed_data
    {
      :title => "Ruby NoName podcast",
      :description => "Серия русскоязычных подкастов о языке Ruby, фреймворке Rails и различных других техонологиях, с ними связанными, начиная от PostgreSQL и Redis, и заканчивая JavaScript. Каждый выпуск состоит из двух частей — короткий блок новостей в мире Ruby, и длинный блок, состоящий из обсуждений и интервью с различными участинками русскоязычного Ruby-сообщества",
      :author => "Андрей Дерябин и Кир Шатров",
      :owner => {:author => "Андрей Дерябин и Кир Шатров", :email => "info@rubynoname.ru"},
      :categories => {"Technology" => ["Podcasting", "Tech News"]},
      :image => "#{site_url}/images/big_logo.jpg",
      :explicit => "no"
    }
  end

  def episode_data
    {
      :subtitle => "Новости мира Ruby и не только",
      :image => "#{site_url}/images/big_logo.jpg",
      :keywords => "Ruby, NoName, RubyNoName, Rails"
    }
  end
end
