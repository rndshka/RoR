require 'markaby'

namespace :report do
  desc 'Нужно сделать rake задачу, которая будет создавать отчет в виде html файла. В отчете должно быть:
число авторов
число статей
число коментариев
название статьи и ссылка на статью с самым большим количеством комментариев
среднее кол-во комментариев в статьях
таблица тегов ( тег, кол-во статей с данным тегом )'
  task :generate => :environment do
    max_comment_articles = Article.joins(:comments).select("articles.*, count(comments.id) as scount").group("articles.id").order("scount DESC")
    max_comment_article = max_comment_articles.first

    average_comments = max_comment_articles.map(&:scount).sum.to_f / max_comment_articles.map(&:scount).size

    mab = Markaby::Builder.new
    mab.html do
      head { title "Отчет" }
      body do
        h1 "Отчет"
        ul do
          li "число авторов: #{Author.count}"
          li "число статей: #{Article.count}"
          li "число коментариев: #{Comment.count}"
          li "название статьи и ссылка на статью с самым большим количеством комментариев: #{max_comment_article.title}  #{max_comment_article.comments.count}"
          li "среднее кол-во комментариев в статьях: #{average_comments}"
        end

        table do
          thead do
            th 'тег'
            th 'кол-во статей'
          end

          tbody do
            Tag.all.each do |tag|
              tr do
                td tag.title
                td tag.articles.count
              end
            end
          end
        end
      end
    end

    File.open(File.join(Rails.root, 'public', 'reports', "report_#{Time.now.to_s.gsub(/\s|\:|\+/,"_")}.html"), 'wb') do |f|
      f.write(mab.to_s)
    end
  end
end