class BWT
  def encode(string)
    (string.length + 1).times.map {|n| (string + "$").chars.rotate n }
      .sort.map(&:last).join
  end

  def decode(encoded_string)
    (encoded_string.length).times
      .reduce([""] * encoded_string.length) {|strings, _| strings.sort.each_with_index.map {|s, n| encoded_string[n] + s } }
      .grep(/\$$/).first.chop
  end
end
