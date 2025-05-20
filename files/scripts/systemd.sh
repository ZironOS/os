set -eoux pipefail

# SystemD Tailscale System Service
ln -s /usr/lib/systemd/system/tailscaled.service /etc/systemd/system/multi-user.target.wants/tailscaled.service

# SystemD RPM-OSTree Update Timer
ln -s /usr/lib/systemd/system/rpm-ostreed-automatic.timer /etc/systemd/system/timers.target.wants/rpm-ostreed-automatic.timer
