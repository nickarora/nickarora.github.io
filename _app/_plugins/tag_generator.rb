module Tag
  module FileStore
    def self.filename(tag_name)
      "#{path}/#{tag_name}#{extension}"
    end

    def self.extension
      ".md"
    end

    def self.path
      File.expand_path("../_tags", __dir__)
    end

    module GetList
      def self.call
        path = FileStore.path
        filenames = Dir.entries(path)

        filenames.filter do |filename|
          extension = File.extname(filename)
          extension == FileStore.extension
        end
      end
    end

    module Add
      def self.call(tag_name)
        filename = FileStore.filename(tag_name)

        extant = File.file?(filename)

        if extant
          return
        end

        File.open(filename, "wb") do |file|
          file.puts("---")
          file.puts("tag-name: #{tag_name}")
          file.puts("---")
        end
      end
    end

    module Remove
      def self.call(tag_name)
        filename = FileStore.filename(tag_name)

        extant = File.file?(filename)

        if not extant
          return
        end

        File.delete(filename)
      end
    end
  end

  module GetList
    def self.call
      tag_filenames = FileStore::GetList.()

      tag_filenames.map do |filename|
        File.basename(filename, FileStore.extension)
      end
    end
  end

  module Add
    def self.call(tag_name)
      FileStore::Add.(tag_name)
    end
  end

  module Remove
    def self.call(tag_name)
      FileStore::Remove.(tag_name)
    end
  end
end

def generate_tags(post)
  tags = post["tags"]
  tags = tags.reject(&:empty?)

  tags.each do |tag|
    Tag::Add.(tag)
  end
end

def delete_unused_tags(posts)
  tags = posts.docs.flat_map do |post|
    post["tags"]
  end.uniq

  generated_tags = Tag::GetList.()

  superfluous_tags = generated_tags - tags

  superfluous_tags.each do |tag|
    Tag::Remove.(tag)
  end
end

Jekyll::Hooks.register :posts, :post_write do |post|
  generate_tags(post)
end

Jekyll::Hooks.register :site, :post_read do |site|
  posts = site.posts
  delete_unused_tags(posts)
end
