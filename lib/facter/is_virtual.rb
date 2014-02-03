Facter.add("iam_virtual") do
    setcode do
	Facter::Util::Resolution.exec("/usr/sbin/dmidecode | grep -ic Reliance.Jio").chomp
    end
end
