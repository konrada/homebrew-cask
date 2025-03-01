cask "perforce" do
  version "2021.2,2252059"
  sha256 "ffc757b9d4d0629b2594e2777edfb18097825e29c70d8f33a444c7482d622806"

  url "https://cdist2.perforce.com/perforce/r#{version.major[-2..]}.#{version.minor}/bin.macosx1015x86_64/helix-core-server.tgz"
  name "Perforce Helix Core Server"
  name "Perforce Helix Command-Line Client (P4)"
  name "Perforce Helix Broker (P4Broker)"
  name "Perforce Helix Versioning Engine (P4D)"
  name "Perforce Helix Proxy (P4P)"
  desc "Version control"
  homepage "https://www.perforce.com/"

  livecheck do
    url "https://www.perforce.com/perforce/doc.current/user/relnotes.txt"
    strategy :page_match do |page|
      page.scan(%r{\((\d+(?:\.\d+)+)/(\d+)\)}i).map do |match|
        "#{match[0]},#{match[1]}"
      end
    end
  end

  depends_on macos: ">= :sierra"

  binary "p4"
  binary "p4broker"
  binary "p4d"
  binary "p4p"

  caveats <<~EOS
    Instructions on using the Helix Versioning Engine are available in

      #{staged_path}
  EOS
end
