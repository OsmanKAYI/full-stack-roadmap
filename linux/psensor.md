# Psensor – Monitor Linux Hardware Temperature 

**Psensor** is a GTK+ (Widget Toolkit for creating Graphical User Interface) based application software that is used to monitor hardware temperature and plot Real-Time graphs from the obtained data for quick review.

### Features of Psensor

- Show the temperature of the motherboard, CPU, GPU (Nvidia), and Hard Disk Drives.
- Show CPU fan speed.
- Psensor is capable of showing remote server temperature and fan speed.
- Show [Linux CPU usage](https://www.tecmint.com/find-linux-processes-memory-ram-cpu-usage/), as well.
- In fact, Psensor will detect any supported hardware and report the temperature as text and over a graph, automatically.
- All the temperatures are plotted in one graph.
- Alarms and Alerts ensure you don’t miss critical system hardware temperature and fan speed-related issues.
- It is easy to configure and use.

### Dependencies

- **lm-sensor and hddtemp** – Psensor depends upon these two packages to get the reports about temperature and fan speed.
- **psensor-server** – It is an optional package, which is required if you want to gather information about remote server temperature and fan speed.

### Installation

```bash
# install dependencies of psensor
sudo apt install lm-sensors hddtemp -y
# install psensor
sudo apt install psensor -y
# install psensor-server which is required only if you want to see the temperature and fan speed of the remote server.
sudo apt install psensor-server -y
```

### Psensor – Monitor Linux Hardware Temperature from CLI

It is an optional but suggestive step you should run sensors-detect as root to diagnose the hardware by sensors and type the default option 'Yes' until you know what you are doing.

```bash
sudo sensors-detect
/etc/init.d/kmod start
sensors
```

**Ref:** [TecMint](https://www.tecmint.com/psensor-monitors-hardware-temperature-in-linux/)