require 'rubygems' if RUBY_VERSION < '1.9'
require 'sinatra/base';
require 'haml'
require 'to_slug.rb'

class RailsGirlsCoaches < Sinatra::Base
  get '/' do
    haml :index
  end

  get '/bucket_list_part_1' do
    haml :bucket_list_part_1
  end

  get '/bucket_list_part_2' do
    haml :bucket_list_part_2
  end

  get '/upload_site' do
    haml :upload_site
  end

  helpers do
    def action_for(action, desc)
      html = <<-HEREDOC
      <div class="tut">
        <input type="checkbox" name="tut" value="#{desc.to_slug}"><span class="label label-success">Action</span>

        #{action}
        <div class="well">#{desc}</div>
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
<input type="checkbox" name="tut" value="#{desc.to_slug}"><span class="label label-#{label}">#{application}</span>
#{desc}
<script type="syntaxhighlighter" class="brush: #{brush_type}; highlight: #{highlight}"><![CDATA[
#{commands}
]]></script>
</div>
END
    end
  end
end
