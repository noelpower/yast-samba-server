# encoding: utf-8

module Yast
  class YaPIDeleteShareClient < Client
    def main
      # test for YaPI::Samba::DeleteShare()
      # $Id$
      # testedfiles: SambaConfig.pm

      Yast.import "SambaConfig"

      Yast.include self, "testsuite.rb"
      Yast.include self, "tests-common.rb"

      SambaConfig.Import(
        {
          "global" => {
            "_modified"        => "1",
            "workgroup"        => "Test",
            "domain master"    => "no",
            "security"         => "user",
            "preferred master" => "yes",
            "domain logons"    => "no",
            "local master"     => "no"
          }
        }
      )

      Yast.import "YaPI::Samba"

      TEST(lambda { YaPI::Samba.DeleteShare("lp") }, [
        @r_common,
        @w_common,
        @x_common
      ], nil)

      nil
    end
  end
end

Yast::YaPIDeleteShareClient.new.main
