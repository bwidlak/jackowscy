namespace :permalink do
  desc "Create missing permalinks for categories"
  task :categories => :environment do
    @categories = Category.find(:all, :conditions => { :permalink => nil })
    
    @categories.each do |category|
      category.permalink = category.name.to_url
      category.save!
    end
  end

  desc "Create missing permalinks for projects"
  task :projects => :environment do
    @projects = Project.find(:all, :conditions => { :permalink => nil })
    
    @projects.each do |project|
      project.permalink = project.name.to_url
      project.save!
    end
  end

  desc "Create missing permalinks for authors"
  task :authors => :environment do
    @authors = Author.find(:all, :conditions => { :permalink => nil })
    
    @authors.each do |author|
      author.permalink = author.name.to_url
      author.save!
    end
  end
end