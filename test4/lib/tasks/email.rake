require 'csv'
namespace :email do
  desc 'Нужно сделать rake задачу, которая будет создавать список пользователей для почтовой рассылки. Формат файла csv.'
  task :generate_list_users => :environment do
    CSV.open(File.join(Rails.root, 'tmp', 'users.csv'), 'wb') do |csv|
       Author.all.each do |author|
         csv << [author.email, author.name]
       end
    end
  end
end