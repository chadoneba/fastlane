module Fastlane
  module Actions
    class ImportFromGitAction < Action
      def self.run(params)
        # this is implemented in the fast_file.rb
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Import another Fastfile from a remote git repository to use its lanes"
      end

      def self.details
        [
          "This is useful if you have shared lanes across multiple apps and you want to store the Fastfile",
          "in a remote git repository."
        ].join("\n")
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :url,
                                       description: "The URL of the repository to import the Fastfile from",
                                       default_value: nil),
          FastlaneCore::ConfigItem.new(key: :branch,
                                       description: "The branch or tag to check-out on the repository",
                                       default_value: 'HEAD',
                                       optional: true),
          FastlaneCore::ConfigItem.new(key: :path,
                                       description: "The path of the Fastfile in the repository",
                                       default_value: 'fastlane/Fastfile',
                                       optional: true),
          FastlaneCore::ConfigItem.new(key: :version,
                                       description: "The version to checkout on the respository. Optimistic operator can be used to select the latest version within constraints",
                                       default_value: nil,
                                       optional: true)
        ]
      end

      def self.authors
        ["fabiomassimo", "KrauseFx", "Liquidsoul"]
      end

      def self.is_supported?(platform)
        true
      end

      def self.example_code
        [
          'import_from_git(
            url: "git@github.com:fastlane/fastlane.git", # The URL of the repository to import the Fastfile from.
            branch: "HEAD", # The branch to checkout on the repository. Defaults to `HEAD`.
            path: "fastlane/Fastfile" # The path of the Fastfile in the repository. Defaults to `fastlane/Fastfile`.
            version: "~> 1.0.0" #The version to checkout on the respository. Optimistic operator can be used to select the latest version within constraints.
          )'
        ]
      end

      def self.category
        :misc
      end
    end
  end
end
