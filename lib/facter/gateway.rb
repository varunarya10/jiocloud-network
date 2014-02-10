Facter.add("default_gw") do
    setcode do
	Facter::Util::Resolution.exec('ip route list | grep default | awk "{print \$3}"').chomp
    end
end
