require "pstore"

class WikiPage
  def initialize( page_name, author, contents)
    @page_name = page_name
    @author = author
    @revisions = Array.new
    @heyyy = Array.new

    @heyy = { :time_now => Time.now, :date_today => Time.now.day }

    add_revision(author, contents)
  end

  attr_reader :page_name, :author

  def add_revision(author, contents)
    @revisions << { :created => Time.now,
                    :author => author,
                    :contents => contents }
  end

  def wiki_page_references
    [@page_name] + [@revisions.last] + [@author]
  end

  home_page = WikiPage.new( "HomePage", "James Edward Gray II",
                          "A page about the JoysOfDocumentation..." )

  # wiki = PStore.new('data')
  # wiki.transaction do
  #   wiki[home_page.page_name] = home_page
  #   wiki[:wiki_index] |= Array.new
  #   wiki[:wiki_index].push(*home_page.wiki_page_references)
  # end

  wiki = PStore.new("wiki_pages.pstore")
    wiki.transaction do  # begin transaction; do all of this or none of it
    # store page...
    wiki[home_page.page_name] = home_page
    # ensure that an index has been created...
    wiki[:wiki_index] ||= Array.new
    # update wiki index...
    wiki[:wiki_index].push(*home_page.wiki_page_references)
  end
end
