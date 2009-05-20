require 'rubygems'
require 'sequel'
require 'fileutils'
require 'cgi'

# NOTE: This converter requires Sequel and the MySQL gems.
# The MySQL gem can be difficult to install on OS X. Once you have MySQL
# installed, running the following commands should work:
# $ sudo gem install sequel
# $ sudo gem install mysql -- --with-mysql-config=/usr/local/mysql/bin/mysql_config

module Jekyll
  module WordPress

    # Reads a MySQL database via Sequel and creates a post file for each
    # post in wp_posts that has post_status = 'publish'.
    # This restriction is made because 'draft' posts are not guaranteed to
    # have valid dates.
    QUERY = "select post_title, post_name, post_date, post_content, post_excerpt, ID, guid from wp_posts where post_status = 'publish'"
    
    def self.fix_body(body)
      b = body.clone
      b.gsub!('http://henrik.nyh.se/blog/', 'http://henrik.nyh.se/')
      b.gsub!(%r{(http://henrik.nyh.se/\d{4}/\d\d/)\d\d/}, '\1')
      b.gsub!(%r{href="/(blog/)?(\d\d\d\d/\d\d)/\d\d/}, 'href="http://henrik.nyh.se/\2/')
      b.gsub!(%r{href="/blog/}, 'href="http://henrik.nyh.se/')
      b.gsub!(%r{<hl( lang="(.*?)")?>(.*?)</hl>}m) {
        lang, content = $2, $3
        
        # explicit &nbsp;s in /2007/11/comma-after-link-in-haml/
        content.gsub!('&nbsp;', ' ')
        
        lang ||= "text"
        lang = "rhtml" if (lang == "html" && content.include?("<%"))
        "{% highlight #{lang} %}#{content}{% endhighlight %}"
      }
      
      
      # /2006/08/quick-keyword-tagging-in-iphoto/ had <p>s inserted into highlighted code because that block was not preceded by a blank line. Fix.
      b.gsub!(/(^.*\S.*$\n)([ \t]*\{% highlight)/, "\\1\n\\2")

      # unclosed: (it'll be somewhere like <code>~/.znc/configs/znc.conf)
      b.gsub!(%{<code>~/.znc/configs/znc.conf}, %{<code>~/.znc/configs/znc.conf</code>})
      
      # missing </p> in /2008/05/iphoto-library-manager-shortcuts-with-drag-and-drop-importing/
      b.sub!('<p class="center"><img src="http://henrik.nyh.se/uploads/iphoto-libraries.png" alt="" class="bordered" /></a>',
             '<p class="center"><img src="http://henrik.nyh.se/uploads/iphoto-libraries.png" alt="" class="bordered" /></a></p>')

      b
    end

    def self.process(dbname, user, pass, host = 'localhost')
      db = Sequel.mysql(dbname, :user => user, :password => pass, :host => host)

      FileUtils.mkdir_p "_posts"

      posts = db[QUERY].to_a
      posts.each do |post|
        # Get required fields and construct Jekyll compatible name
        title = CGI.unescapeHTML(post[:post_title]).gsub('&ndash;', "—")  # actually a mdash glyph, but more appropriate
        slug = post[:post_name]
        date = post[:post_date]
        content = fix_body(post[:post_content])

        tag_query = "SELECT cat_name FROM wp_categories JOIN wp_post2cat ON wp_categories.cat_ID=wp_post2cat.category_id WHERE wp_post2cat.post_id=#{post[:ID]}"
        tags = db[tag_query].map {|t| t[:cat_name] }

        name = "%02d-%02d-%02d_%02d-%02d-%s.markdown" % [date.year, date.month, date.day, date.hour, date.min, slug]

        # Get the relevant fields as a hash, delete empty fields and convert
        # to YAML for the header
        data = {
           'title' => title.to_s,
           'wordpress_id' => post[:ID],
           'tags' => tags.reject {|t| t == "Uncategorized" }
         }.delete_if { |k,v| v.nil? || v == ''}.to_yaml

        # Write out the data and content to file
        File.open("_posts/#{name}", "w") do |f|
          f.puts data
          f.puts "---"
          f.puts content
        end
      end

    end
  end
end
