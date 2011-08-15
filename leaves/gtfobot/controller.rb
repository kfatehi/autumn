# Controller for the Gtfobot leaf.

class Controller < Autumn::Leaf
  before_filter :authenticate, :only => :stop, :admin => 'keyvan'
  
  # Typing "!about" displays some basic information about this leaf.
    
  def did_start_up
    stems.message "#{stem.channel_members.inspect}"
  end
  
  def inspect_command(stem, sender, reply_to, msg)
    stems.message "stems: #{stems.inspect}"
    stems.message "sender: #{sender.inspect}"
    stems.message "reply_to: #{reply_to.inspect}"
    stems.msg "msg: #{msg.inspect}"
  end
  
  def about_command(stem, sender, reply_to, msg)
    # This method renders the file "about.txt.erb"
  end
  
  private
  def status
    @started ? "Enabled" : "Disabled"
  end
end
