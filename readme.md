# Constant Questioning

Just a quick little problem I wanted to implement after @kch posted this tweet: https://twitter.com/kch/status/98286316822863872

      def Symbol?(_)
        _.is_a?(Symbol)
      end
      # and the method_missing generic implementation thereof

      discuss.

Not sure I like the usecase, but I wanted to see how I'd solve it.

## Licence

MIT - (c) 2011 Caius Durling
