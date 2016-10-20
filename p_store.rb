require "pstore"

class WikiPage

  attr_reader :page_name

  def initialize(page_name, author, contents)
    @page_name = page_name
    @revisions = Array.new

    add_revision(author, contents)
  end

  def add_revision( author, contents )
    @revisions << { :created => Time.now,
                    :author => author,
                    :contents => contents }
  end

  def wiki_page_references
    [@page_name] + @revisions.last[:contents].scan(/\b(?:[A-Z]+[a-z]+){2,}/)
  end

  home_page = WikiPage.new("Home page", "James", "A page about ....")

  wiki = PStore.new("wiki_pages.pstore")
  wiki.transaction do
    wiki[home_page.page_name] = home_page
    wiki[:wiki_index] ||= Array.new
    wiki[:wiki_index].push(*home_page.wiki_page_references)

  end

  wiki = PStore.new("wiki_pages.pstore")
  wiki.transaction(true) do
    wiki.roots.each do |data_root_name|
      p data_root_name
      p wiki[data_root_name]
    end
  end
end
