# Controller for the Getoutbot leaf.

class Controller < Autumn::Leaf
  
  # Typing "!about" displays some basic information about this leaf.
  
  def go_command(stem, sender, reply_to, msg)
    go = true
    while go
      nicks = []
      stem.channel_members["#fossgames"].each {|nick,rank| nicks << nick}
      nicks.delete stem.nickname
      if nicks.any?
        stems.message "ATTN: #{nicks.join(', ')}"
        stems.message "Please leave #fossgames and join ##fossgames instead. Thank you!"
        sleep 30
      else
        stems.first.part "#fossgames"
        sleep 1
        stems.first.join "#fossgames", ""
        stems.first.join "##fossgames"
        stems.message "#fossgames belongs to me."
        go = false
      end
    end
  end
  
  def opme_command(stem, sender, reply_to, msg)
    stems.first.mode "#fossgames", "+o", sender[:nick]
  end
  
end
