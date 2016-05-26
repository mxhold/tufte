module Tufte
  module Helpers
    def self.sidenote(id, note)
        <<-HTML.chomp
<label for="#{id}" class="margin-toggle sidenote-number"></label>
<input type="checkbox" id="#{id}" class="margin-toggle"/>
<span class="sidenote">
#{note}
</span>
        HTML
    end

    def self.marginnote(id, note)
      <<-HTML.chomp
<label for="#{id}" class="margin-toggle">&#8853;</label>
<input type="checkbox" id="#{id}" class="margin-toggle"/>
<span class="marginnote">
#{note}
</span>
      HTML
    end
  end
end
