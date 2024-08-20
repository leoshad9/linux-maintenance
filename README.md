# Linux System Maintenance

This repository contains Bash scripts for Linux system maintenance tasks, such as cleaning log files and updating the Linux system.

## Prerequisites

- **Bash**: The scripts are written in Bash, so you'll need a Bash-compatible shell to run them.
- **Permissions**: Some scripts may require root (sudo) permissions.

## Scripts Overview

### 1. `cleanlog.sh`

**Author**: Mohammad Shadman

**Description**: This script empties the `messages` and `wtmp` log files in the `/var/log` directory. It's useful for cleaning up log files and saving disk space.

**Usage**:

```bash
sudo ./cleanlog.sh
```

**Functionality**:

- **Directory Change**: The script navigates to the `/var/log` directory.
- **Log Clearing**: It clears the contents of the `messages` and `wtmp` files.
- **Permission Check**: If the script encounters a permissions issue, it prompts the user to rerun the script with `sudo`.

**Example**:

```bash
sudo ./cleanlog.sh
```

**Expected Output**:

- Success: `Done`
- Permission Error: `Permission denied: Type 'sudo ./cleanlog.sh'`

### 2. `sysmaintain.sh`

**Author**: Mohammad Shadman

**Description**: This script updates and cleans the Linux system by running a series of `apt-get` commands. It updates package lists, upgrades installed packages, removes unnecessary packages, and cleans up package files.

**Usage**:

```bash
sudo ./sysmaintain.sh
```

**Functionality**:

- **Update**: Runs `apt-get update` to refresh the package list.
- **Upgrade**: Runs `apt-get upgrade` and `apt-get dist-upgrade` to install available updates.
- **Clean Up**: Removes unnecessary packages and cleans up package files with `apt-get autoremove`, `apt-get clean`, and `apt-get autoclean`.
- **Timestamp**: The script logs the start and end times of the process.

**Example**:

```bash
sudo ./sysmaintain.sh
```

**Expected Output**:

The script outputs timestamps at the beginning and end of the update process:

```
DD-MM-YYYY --- HH:MM:SS --- Starting
... (output of apt-get commands) ...
DD-MM-YYYY --- HH:MM:SS --- Done
```

## Contributing

If you have suggestions or improvements, feel free to fork the repository and submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
