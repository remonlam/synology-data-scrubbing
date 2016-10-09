# This script will execute a data scrubbing job on a Synology NAS
Because there's no "normal" way to create a Data Scrubbing scheduled task, we need to this the hard way ;-)
although it's not that hard, however it takes a bit more than just clicking some wizard, below you will find all the steps required to create a scheduled data scrubbing task.

- Enable SSH
- Copy the file from GitHub
- Check if it's executable
- Create a scheduled tasks
- Run the script
- Disable SSH

## Enable SSH on the NAS;
Login to DSM (like; https://your-nas:5001/)
![Enable SSH](/docs/enable_ssh_nas.png)
Open Control Panel and to to Terminal & SNMP, and make sure that Enabled SSH Service is checked (enabled)

## Copy the "start_data_scrubbing.sh" to (for example) /volume1/start_data_scrubbing.sh

## Make sure that SSH is enabled on the NAS itself,
wget -P /volume1/ https://raw.githubusercontent.com/remonlam/synology-data-scrubbing/master/start_data_scrubbing.sh
