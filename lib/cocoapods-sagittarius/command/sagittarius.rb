module Pod
  class Command
    # This is an example of a cocoapods plugin adding a top-level subcommand
    # to the 'pod' command.
    #
    # You can also create subcommands of existing or new commands. Say you
    # wanted to add a subcommand to `list` to show newly deprecated pods,
    # (e.g. `pod list deprecated`), there are a few things that would need
    # to change.
    #
    # - move this file to `lib/pod/command/list/deprecated.rb` and update
    #   the class to exist in the the Pod::Command::List namespace
    # - change this class to extend from `List` instead of `Command`. This
    #   tells the plugin system that it is a subcommand of `list`.
    # - edit `lib/cocoapods_plugins.rb` to require this file
    #
    # @todo Create a PR to add your plugin to CocoaPods/cocoapods.org
    #       in the `plugins.json` file, once your plugin is released.
    #
    class Sagittarius < Command
      self.summary = 'custom cocoapods plugin -- sagittarius'

      self.description = <<-DESC
        Longer description of cocoapods-sagittarius.
      DESC

      # self.arguments = 'NAME'
      self.arguments = [
          CLAide::Argument.new('NAME', true),
          CLAide::Argument.new('SOURCE', false)
      ]
      def self.options
        [
          ['--argument1', 'optional argument'],
          ['--argument2', 'optional argument'],
          ['--argument3', 'optional argument'],
          ['--argument4', 'optional argument'],
          ['--argument5', 'optional argument'],
          ['--argument6', 'optional argument'],
        ]
      end
      def initialize(argv)
        @name = argv.shift_argument
        @source = argv.shift_argument

        @argument1 = argv.flag?('argument1')
        @argument2 = argv.flag?('argument2')
        @argument3 = argv.flag?('argument3')
        @argument4 = argv.flag?('argument4')
        @argument5 = argv.flag?('argument5')
        @argument6 = argv.flag?('argument6')
        super
      end

      def validate!
        super
        help! 'A Pod name is required.' unless @name
      end

      def run
        UI.puts "Add your implementation for the cocoapods-sagittarius plugin in #{__FILE__}"
      end
    end
  end
end
