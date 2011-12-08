WIRBLE_VERSION = '0.1.3'
INTERACTIVE_EDITOR_VERSION = '0.0.10'

def try_require(lib)
  begin
    require lib
    yield if block_given?
  rescue LoadError => e
    warn "Couldn't load #{lib}: #{e}"
  end
end

try_require 'rubygems'

try_require "#{ENV['GEM_HOME']}/gems/wirble-#{WIRBLE_VERSION}/lib/wirble" do
  Wirble.init
  Wirble.colorize
end

# Enable 'vim' method to edit irb code in vim
try_require "#{ENV['GEM_HOME']}/gems/interactive_editor-#{INTERACTIVE_EDITOR_VERSION}/lib/interactive_editor"

