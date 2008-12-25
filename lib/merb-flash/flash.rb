class Flash
  def initialize(*args)
    @attrs = Mash.new(*args)
    @keepers = []
  end

  def []=(key, value)
    @attrs[key] = value
    keep key
  end
    
  def update(hash)
    @attrs.update(hash)
    hash.keys.each {|key| keep key}
  end
        
  def method_missing(method_name, *args, &block)
    @attrs.send(method_name, *args, &block)
  end

  def keep(key)
    key = key.to_s
    @keepers << key unless @keepers.include?(key)
  end

  def sweep
    @attrs.keys.each {|key| @attrs.delete(key) unless @keepers.include?(key)}
    @keepers = []
  end
end