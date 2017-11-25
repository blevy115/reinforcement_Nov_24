ballots = [{1 => 'Smudge', 2 => 'Tigger', 3 => 'Simba'},
           {1 => 'Bella', 2 => 'Lucky', 3 => 'Tigger'},
           {1 => 'Bella', 2 => 'Boots', 3 => 'Smudge'},
           {1 =>'Boots', 2 => 'Felix', 3 => 'Bella'},
           {1 => 'Lucky', 2 => 'Felix', 3 => 'Bella'},
           {1 => 'Smudge', 2 => 'Simba', 3 => 'Felix'}]

#1st place 3 votes
#2nd place 2 votes
#3rd place 1 vite

total_votes = {}

ballots.each do |tally|
  tally.each do |place, name,|
      if total_votes[name] == nil
        if place == 1
        total_votes[name] = 3
      elsif place == 2
        total_votes[name] = 2
      elsif place ==3
        total_votes[name] = 1
      end
    else
    if place == 1
      total_votes[name] += 3
    elsif place == 2
      total_votes[name] += 2
    elsif place ==3
      total_votes[name] += 1
    end
  end
end
end
total_votes = total_votes.sort_by{|name, votes| votes }.reverse



total_votes.each_with_index do |c,i|
  if total_votes[i][1] == total_votes[i-1][1]
    total_votes[i][0] = (total_votes[i][0] + ' and ' + total_votes[i-1][0])
    total_votes[i-1][0] = 'delete'
  end

end

total_votes.each do |c|
  if c[0]=='delete'
    total_votes.delete(c)
  end
end


total_votes.each_with_index do |(name, votes), index|
  puts "Position #{index + 1} goes to #{name} with #{votes} votes!"
end
