require 'liquid'
require 'uri'

# Capitalize all words of the input
module Jekyll
  module DowncaseFirst
    def downcase_first(words)
      return words[0].downcase + words[1..-1]
    end
  end
end

Liquid::Template.register_filter(Jekyll::DowncaseFirst)
