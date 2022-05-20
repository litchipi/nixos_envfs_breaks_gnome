# Gnome break on NixOS

Minimal non-working example.

## Steps

``` bash
# Build locally
nix build .#vm

# Build remotely
nix build github:litchipi/nixos_envfs_breaks_gnome#vm

./result/bin/run-joevm-vm
```

- On Qemu graphical window, go on "View", "Show tabs", and go to the "serial0" tab.
- Connect yourself on the tty using "joe" as username and password
- Use the command "journalctl --follow" to get the errors log
- Come back to the "VGA" tab and connect yourself on gnome login page
- Go check the log, scroll to see a lot of errors, including:

```
joevm systemd[1216]: org.gnome.Shell@x11.service: Failed to locate executable /bin/sh: No such file or directory
```

The `/bin` folder is empty and everything is stored inside `/run/current-system/sw/bin`

## Element breaking the system

If you comment the `inputs.envfs.nixosModules.envfs` module in the flake,
everything works again.
