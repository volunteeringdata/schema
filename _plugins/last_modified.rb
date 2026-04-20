Jekyll::Hooks.register :site, :post_read do |site|
  (site.pages + site.posts.docs).each do |doc|
    next if doc.data["last_modified"]

    path = File.join(site.source, doc.relative_path)
    next unless File.exist?(path)

    date = `git log -1 --format="%ci" -- "#{path}"`.strip
    doc.data["last_modified"] = date unless date.empty?
  end
end
