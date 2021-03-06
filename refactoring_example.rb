class MicroBlogger
  
  def start
    command = ""
    while command != "q"
      printf "enter command: "
      command = gets.chomp
      process(command)
    end
  end
  
  class QuitCommand
    def match?(input)
      input == "q"
    end
  
    def execute
      puts "Goodbye"
    end
  end
  
  class TweetCommand
    def match?(input)
      input == "tweet"
    end
  
    def execute
      puts "tweeting"
    end
  end
  
  class DirectMessageCommand
    def match?(input)
      input == "dm"
    end
  
    def execute
      puts "direct messaging"
    end
  end
  
  class HelpCommand
    def match?(input)
      input == "help"
    end
  
    def execute
      puts "helping"
    end
  end
  
  class NoActionCommmand
    def match?(input)
      input == "no_action"
    end
    
    def execute
    end
  end
  
  def commands
    quit = QuitCommand.new
    tweet = TweetCommand.new
    dm = DirectMessageCommand.new
    help = HelpCommand.new
    no_action = NoActionCommmand.new
    
    commands = [ quit, tweet, dm, help, no_action ]
  end
  
  def command_for_input(input)
    commands.find { |command| command.match?(input) }
  end
  
  def process(input)
    command_for_input(input).execute
  end
  
end