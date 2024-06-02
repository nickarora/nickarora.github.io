def generate_tags(post)
  tags_directory = File.expand_path("../_tags", __dir__)
  tag_file_extension = ".md"

  filenames = Dir.entries(tags_directory)
  filenames = filenames.filter do |filename|
    extension = File.extname(filename)
    extension == tag_file_extension
  end

  generated_tags = filenames.map do |filename|
    File.basename(filename, tag_file_extension)
  end

  tags = post["tags"]
  tags = tags.reject(&:empty?)

  generated_tags.each do |generated_tag|
    if tags.include?(generated_tag)
      next
    end

    filename = "#{tags_directory}/#{generated_tag}#{tag_file_extension}"
    File.delete(filename)
  end

  tags.each do |tag|
    if generated_tags.include?(tag)
      next
    end

    filename = "#{tags_directory}/#{tag}#{tag_file_extension}"
    File.open(filename, "wb") do |file|
      file.puts("---")
      file.puts("tag-name: #{tag}")
      file.puts("---")
    end
  end
end

Jekyll::Hooks.register :posts, :post_write do |post|
  generate_tags(post)
end
