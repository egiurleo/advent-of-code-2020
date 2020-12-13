# frozen_string_literal: true

module AdventOfCode2020
  class Day13
    module BusScheduler
      def self.wait_time(arrival_time, bus_id)
        soonest_viable_departure =
          ((arrival_time * 1.0) / (bus_id * 1.0)).ceil * bus_id

        soonest_viable_departure - arrival_time
      end

      # Adaptation of this solution:
      #
      # https://topaz.github.io/paste/#XQAAAQCOBQAAAAAAAAARiAboWcAga5Ub+IqVCF9SGLwPKYtrMP2XgE/fWLi7xHuXlZouqEJJDfXifLVuCVGX6aOlxFeV2mKB1BHyi3U9kjIQu5R8rYipl/9g48kxjRFzbWN7N6cPrZNY1PQylckAj5GYfnJMGqFSo3Viy16bRKw2k+NCarYqAZde3UlPnzA3aSOrOKWv6FhyeICi5nV7SUB+zxfkKQN/l43+0ref2fPRBIK23SrsQ9M5Adi3x9oAByPlTmzY1/hlG7XlkiMgwxatyJweh947ADLpiyuKTvIT2dPotzGyHpDmwgL8n4eeIqYhr6cxMpwKawcf/ROhruzzv9ktwsvsLgMuHDZAJm2s5U7sDw8wCth01NalitCwZWKTXCCN40/uY6AZr9EHBXSXDlJ/hOt3uTPrl+1kIoFZFG060Leb09wpi2iMKq4tPapDZ0aweSJQfPJVPwSuxWvpSn0AzCtlPWsKkDnOLNKJUCdwhAanrqKlz7joEaDE2OpLFxJMBZNVUgV+RH7DkvFSDjOS8BcD/JSYXJ7AtAYjJ/Yq3HjYnzKUMema9FX2lBPKku6RsaiVfW1VWGDFvRmizPB99iEArC/CggebNiZ4eBTIHToCydqM8ecrumfz0K4FxO08bP8Q0EGsY0TtZMyfhmRv75tKEFVMzkzzFVQ6jIHmsTuD7kT+buCdP37zNjm21ipVM/5amyGZwkoWK0ML9wRi0D1JTWH0/8iF4sh5KVPr3BvchfStf0BOyD4iP1h0LXRVGhGNowLnapHSOFQSDF8DLRSl/tknSbrbV93bVPf8iSH4HgvrvTA38g3Lstct25twAlPAYxeQ9S+BP9YNkUESRJtLnQIboynoE1UInUeD/dTbFuupS1AyFOekgqdLQKbq/9wfDr8=
      def self.earliest_timestamp(bus_ids)
        timestamp = 0
        step = 1

        bus_ids.each_with_index do |bus_id, idx|
          next if bus_id == 'x'

          timestamp += step while (timestamp + idx) % bus_id != 0

          step *= bus_id
        end

        timestamp
      end
    end
  end
end
