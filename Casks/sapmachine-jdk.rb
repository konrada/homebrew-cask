cask "sapmachine-jdk" do
  arch = Hardware::CPU.intel? ? "x64" : "aarch64"

  version "17.0.2"

  if Hardware::CPU.intel?
    sha256 "c00b7a32f7be3e1a400d815c22d0e254cdab0e8f421cb6d63ef8a50c8e8a501a"
  else
    sha256 "7502b95cf9e691197e21637a8e4acfca3a0955aa11f36e47824bf0083085bfc2"
  end

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jdk-#{version}_macos-#{arch}_bin.dmg",
      verified: "github.com/SAP/SapMachine/"
  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK distribution from SAP"
  homepage "https://sapmachine.io/"

  # The version information on the homepage is rendered client-side from the
  # following JSON file, so we have to check it instead.
  livecheck do
    url "https://sap.github.io/SapMachine/assets/data/sapmachine_releases.json"
    regex(/["']tag["']:\s*["']sapmachine[._-]v?(\d+(?:\.\d+)+)["']/i)
  end

  artifact "sapmachine-jdk-#{version}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-jdk-#{version}.jdk"
end
