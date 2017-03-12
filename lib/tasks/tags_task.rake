namespace :tags do
  task :generate_tags => :environment do
    doc = YAML.load_file("config/first_level_tags.yml")
    doc.each do |d|
      flt = FirstLevelTag.find_by_name(d['name'])
      unless flt
        flt = FirstLevelTag.create(name: d['name'], description: d['description'])
        puts "created #{d['name']}"
        d['tags'].each do |t|
          tag = Tag.find_by_name(t)
          unless tag
            tag = Tag.create(name: t, first_level_tag_id: flt.id)
            puts "created #{tag.name}"
          end
        end
      end
    end
  end
end
