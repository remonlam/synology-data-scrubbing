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
Login to DSM (example; https://your-nas:5001/)

![Enable SSH](/docs/enable_ssh_nas.png)
Open Control Panel and go to Terminal & SNMP, and make sure that Enabled SSH Service is checked (enabled)


### Create a SSH session to the NAS
Use a terminal emulator like Terinal/Console for OSX/Linux of Putty for the Windows folks

ssh admin@your-nas
and open a new session as root

sudo su -


## Copy the "start_data_scrubbing.sh" to (for example) /volume1/start_data_scrubbing.sh
wget -P /volume1/ https://raw.githubusercontent.com/remonlam/synology-data-scrubbing/master/start_data_scrubbing.sh


## Check if the script is executable
Go to the location where the script has been stored (in this example it's /volume1)
cd /volume1
ls -lh

It should show something like this;
root@nas:/volume1# ls -lh
-rwxr-xr-x 1 root root 402 Oct  9 15:54 start_data_scrubbing.sh

It it's not executable just run;
chmod 755 start_data_scrubbing.sh


## Create a scheduled task
Go back to the DSM (web console).

![Create task 1](/docs/create_task_1.png)
Open Control Panel and go to Task Scheduler

![Create task 2](/docs/create_task_2.png)
Next, go to "Create" --> "Scheduled Taks" --> "User-defined script".

![Create task 3](/docs/create_task_3.png)
Enter a name (for example; Data Scrubbing on node NAS) and make sure it runs as root!

![Create task 4](/docs/create_task_4.png)
According Synology it's best to run Data Scrubbing once every month, so create a schedule that it run's every month.

![Create task 5](/docs/create_task_5.png)
Optional is to get an email when the script has run.
If you want this enter your mail address.

The last step is to fill in the location of the script that have been copied earlier.
In my example it's /storage1/start_data_scrubbing.sh and click on OK to create the task.

![Create task 6](/docs/create_task_6.png)
Check if the tasks has been created.

![Create task 7](/docs/create_task_7.png)
To check if everything is working select the task and click on "Run".


## Check if the script is executing a Data Scrubbing job
In DSM (web console) open the Storage Manager

![Check if script is doing something](/docs/check_taks.png)
And select either Volumes or Disk Group and check if it's there are Parity Check's running

NOTE: Depending on the amount of data stored on the disk and the total size of the disks this can take some time to complete...


## Disable SSH
Because we don't need SSH to be open anymore it's security wise better to disable it.
In DSM (web console) open the Control Panel

![Disable SSH](/docs/disable_ssh.png)
Uncheck "Enable SSH Service" and click on Apply, SSH is no disabled!
