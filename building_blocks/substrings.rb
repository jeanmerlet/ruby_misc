def substrings(string, array)
  word_count = Hash[array.map {|w| [w, 0]}]
  string_words = string.downcase.split(/[^a-z]+/)

  word_count.keys.each do |w|
    string_words.length.times do |i|
      string_words[i].match(w) {|m| word_count[w] += 1}
    end
    word_count.delete(w) if word_count[w] == 0
  end

  puts word_count
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

substrings("Howdy partner, sit down! How's it going?", dictionary)

