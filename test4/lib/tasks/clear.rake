namespace :clear do
  desc 'Нужно сделать rake задачу, которая будет удалять старые статьи, должно остаться по 5 самых новых статей от каждого автора.'
  task :articles => :environment do
    article = Article.order('created_at DESC').limit(5).last
    Article.where('created_at < ?', article.created_at).delete_all
  end
end