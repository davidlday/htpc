# HTPC

In 2011 I cut the cable cord. This repo has a little info about my experience, as well as scripts and configs I need if things go wrong.

## Hardware

* SilverStone Aluminum/Steel Micro ATX HTPC Computer Case GD05B (Black)
* Corsair CMPSU-430CX CX Series 430-watt Power Supply Compatible with Core I7 and Core I5
* ASUS Socket AM3/AMD 880G/USB3.0/Hybrid CrossFireX/A&V&GbE/Micro ATX Motherboard s M4A88T-M/USB3
* MD Athlon II X3 450 95W Processor (ADX450WFGMBOX)
* Corsair XMS3 4GB (2x2GB) DDR3 1333 MHz (PC3 10666) Desktop Memory (TW3X4G1333C9A) - Two sets for total of 8GB RAM
* ASUS GeForce 210 1GB 64-bit DDR3 PCI Express 2.0 x16 Low Profile Ready Video Card, EN210 SILENT/DI/1GD3/V2(LP)
* Western Digital 500 GB Caviar Blue SATA 3 Gb/s 7200 RPM 16 MB Cache Bulk/OEM Desktop Hard Drive (WD5000AAKS) - Primary OS Drive
* Western Digital Caviar Green 2 TB Desktop Hard Drive (WD20EARS) - Media Drive
* Lite-On LightScribe 24X SATA DVD+/-RW Dual Layer Drive IHAS424-98
* SiliconDust HDHomeRun DUAL High Definition Digital TV Tuner HDHR3-US
* Azend Group MediaGate HA-IR01SV Windows Vista Home Premium and Windows Vista Ultimate Media Center Remote Control, 1 Channel IR (Silver)
* Winegard DS-2000 Universal Antenna Mount with U-bolts
* Winegard MS-2002 HDTV Antenna without Cable

Check my original [Amazon HTPC Listmania list](https://www.amazon.com/Cable-free-Home-Theater-PC/lm/RBUBOIY92LPY5/cm_lm_byauthor_title_full/ref=as_li_ss_tl?_encoding=UTF8&camp=1789&creative=390957&linkCode=ur2&tag=davidlday-20&linkId=GYZUMRQPDX3XNQBQ) for more details.


## Software

* Windows 10 - Originally Windows 7 Home Premium with Media Center.
* Plex - The most awesome HTPC software available. If only it had DVR & Live TV functionality.
* NextPVR - Needed to fill gap left by Media Center when I upgraded to Windows 10
* zap2xml - Electronic Programming Guide
* CrashPlan - Backups
* HandBrake - Transcoding and DVD ripping

Most of the software is pretty straight forward. However, in my quest to replace Media Center, I wound up having to create custom batch files to manage things like the Electronic Programming Guide (EPG), transcoding, and getting Plex and NextPVR working together reasonably well. Most of the scripts here deal with those challenges.

### NextPVR References

Links to resources that helped me get things working.

* [StackOverflow - How to check if a process is running via a batch script](http://stackoverflow.com/questions/162291/how-to-check-if-a-process-is-running-via-a-batch-script)
* [StackOverflow - Hidden features of Windows batch files](http://stackoverflow.com/questions/245395/hidden-features-of-windows-batch-files)
* [NextPVR Wiki - JavaWiz Batch Templates](http://www.nextpvr.com/nwiki/pmwiki.php?n=Configuration.BatchFiles)
* [Sangara2.com - NextPVR Batch Files](http://www.sangera2.com/main/misc/nextpvr.html)
* [psyciknz - NextPVR Plex Plugin](https://github.com/psyciknz/NextPVR-Plex)

