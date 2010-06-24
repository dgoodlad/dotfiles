def try_require(lib)
  begin
    require lib
    yield if block_given?
  rescue LoadError => e
    warn "Couldn't load #{lib}: #{e}"
  end
end

try_require 'rubygems'

try_require 'wirble' do
  Wirble.init
  Wirble.colorize
end

# Enable 'vim' method to edit irb code in vim
try_require 'interactive_editor'

