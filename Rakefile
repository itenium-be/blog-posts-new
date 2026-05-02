require 'date'
require 'fileutils'

DRAFTS_DIR = '_drafts'

def slugify(title)
  title.downcase.gsub(/[^a-z0-9]+/, '-').gsub(/^-|-$/, '')
end

def draft_template(title:, slug:, date:)
  yaml_title = title.gsub('"', '\\"')
  <<~END
    ---
    layout: post
    author: Wouter Van Schandevijl
    title: "#{yaml_title}"
    subTitle: ""
    date: #{date}
    desc: >
      only used in og:desc
    bigimg:
      url: #{slug}-big.png
      prompt: " --ar 4:1"
      origin: Midjourney
    img:
      url: #{slug}-sm.png
      prompt: ""
      origin: Midjourney
    categories: productivity | dotnet | javascript | dev-setup | design | trends | security | docker | databases | ruby
    tags: [powershell,autohotkey,sql,angular,testing,excel,git,cheat-sheet,tutorial,windows,product,war-story,regex,debugging,meta,tech-talk,pragmatic-tips,fun,hacking,book-review,synology,mongo]
    series: series-unique-name
    interesting:
      - url:
        desc: ""
    extras:
      - url:
        desc: ""
    toc:
      title:
      icon:
    package-versions:
      - package:
        version:
    last_modified_at:
    updates:
      - date:
        desc: ""
    ---

    {: .hide-from-excerpt}

    <!--more-->

    Img: 500x500
    BigImg: 2000x500


    <!--block1-->

    ##
  END
end

desc 'Create a draft: rake draft["My Post Title"] (commas in title OK)'
task :draft, [:title] do |_, args|
  title = args.to_a.join(', ')
  title = ENV['TITLE'] if title.empty?
  abort('Usage: rake draft["My Post Title"]  (or  rake draft TITLE="My Post")') if title.nil? || title.empty?

  slug = slugify(title)
  date = Date.today.strftime('%Y-%m-%d')
  path = File.join(DRAFTS_DIR, "#{date}-#{slug}.md")

  abort("Already exists: #{path}") if File.exist?(path)

  FileUtils.mkdir_p(DRAFTS_DIR)
  File.write(path, draft_template(title: title, slug: slug, date: date))
  puts "Created #{path}"
end
