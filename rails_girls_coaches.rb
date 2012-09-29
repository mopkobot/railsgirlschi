require 'rubygems' if RUBY_VERSION < '1.9'
require 'sinatra/base'
require 'haml'
require 'to_slug.rb'

class RailsGirlsCoaches < Sinatra::Base
  get '/' do
    haml :index
  end

  paths = %w{
    bucket_list_part_1
    bucket_list_part_2
    rg_answers_part_1
    rg_answers_part_2
    event_tracker_part_1
    event_tracker_part_2
    rails_reviews_part_1
    rails_reviews_part_2
    short_url_part_1
    short_url_part_2
    upload_site
    hello_world
  }

  paths.each do |path|
    get "/#{path}" do
      haml path.to_sym
    end
  end

  helpers do
    def action_for(action, desc="")
      well = ""
      well = "<div class='well'>#{desc}</div>" unless desc.empty?

      html = <<-HEREDOC
      <div class="tut">
        <label>
        <input type="checkbox" name="tut" value="#{desc.to_slug}"><span class="label label-success">Action</span>

        #{action}
        </label>
        #{well}
      </div>
      HEREDOC
    end

    def tutorial_for(brush_type, desc, commands, highlight=[])
      if brush_type == "plain"
        application = "Terminal"
        label = "inverse"
      else
        application = "Text-Editor"
        label = "warning"
      end

html = <<-END
<div class="tut">
<label>
<input type="checkbox" name="tut" value="#{desc.to_slug}"><span class="label label-#{label}">#{application}</span>
#{desc}
</label>
<script type="syntaxhighlighter" class="brush: #{brush_type}; highlight: #{highlight}"><![CDATA[
#{commands}
]]></script>
</div>
END
    end
  end
end
