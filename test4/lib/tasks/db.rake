namespace :db do
  desc 'Нужно сделать rake задачу, которая очистит и сгенерирует базу из задания на генерацию (FactoryGir).'
  task :reseed => :environment do
    Rake::Task["db:drop"].invoke
    Rake::Task["db:setup"].invoke
  end
end