# linux-admin-scripts
Production Linux Administration scripts used in BFSI domain (BaNCS24 CBS, RTGS/NEFT Support)

**Author:** Vishwajit Bhikale - Assistant System Analyst @ C-Edge Technologies (TCS-SBI) - Since 24 April 2025
**Domain:** BaNCS24 Core Banking Support for 200+ Co-operative Banks & RRBs

## Scripts

1. **disk_alert.sh** - Monitors disk usage >80% and logs alert. Used for daily health checks on RHEL prod servers (df -h, logger).

2. **log_cleaner.sh** - EOD log cleanup - Deletes app logs older than 7 days, saves disk space, used during EOD operations.

3. **service_monitor.sh** - Checks if Apache/MQ services are running, auto-restarts if down, logs status. Used for SFMS/IIB service monitoring.

4. **user_create_bulk.sh** - Bulk user creation for L1/L2 team onboarding from CSV. Handles useradd, password set, chage.

5. **backup.sh** - Daily config backup before BAR deployment/EOD, tar + gzip with retention of 15 days.

## How to Use
```bash
chmod +x *.sh
./disk_alert.sh
./log_cleaner.sh
./service_monitor.sh
```

## Skills Demonstrated
RHEL Linux, LVM, Cron, Systemd, Bash Scripting, Log Analysis, Apache, MQ, DR Drills, Autosys monitoring

**Linked to Resume:** github.com/vishwajit-bhikale/linux-admin-scripts
