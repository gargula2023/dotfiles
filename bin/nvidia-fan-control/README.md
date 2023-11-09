# nvidia-fan-control

I have made this software because I often see too complex or too simple solutions:  
- It works with NVIDIA's proprietary drivers, X11 and x86-64 computers;
- It is the combination of a simple bash script and two binary files (one for checking temperature and one for setting fan speed).

This software works well enough for me, but it is still work in progress!  

## Usage

It could be tricky for the newbie, but you need to:  
1. Modify `nvidia-fan-curve.sh` so it can find `nv-control-core-temperature` and `nv-control-fan`, or put the binaries on your $PATH (I have it in my `~/.local/bin` folder);
2. Launch `nvidia-fan-curve.sh` as you wish, I advise to try it on a terminal to see if it works correctly.  

You can make it a startup script in multiple ways: I use i3wm so I just have to add it to my config file.  

## Technical informations

### Fan curve points

This script will set the fan speed accordingly to a fan curve specified by points.  

The points have two coordinates specified by two arrays:
- `temperature_points` for temperatures;
- `fan_speed_points` for fan speed.

![fan curve example](./fan_curve_example.png)

**You need to edit the arrays with the values that you want!**

### Self explanatory variables

I think that the script has self explanatory variables, so it should be easy to understand and debug.

### Fan hysteresis logic

It was a nice to have feature so I have implemented a simple fan hysteresis logic, it is controlled by `temperature_hysteresis` variable.  
When a new fan speed gets setted, the temperature for which the fan speed decreases is calculated as `step_down_temperature`.

### Reason of the binary files

I have compiled two binaries `nv-control-fan` and `nv-control-core-temperature` using the NV-CONTROL extension:
- `nv-control-fan` controls the fans: **it sets all the fans of the graphics card to the same speed**;
- `nv-control-core-temperature` queries the core GPU temperature.

Both this commands can be changed with commands already available from the installed NVIDIA's driver:
- `nv-control fan $fan_speed` can be changed with `nvidia-settings -a gputargetfanspeed=$fan_speed` **but I have noticed in-game stuttering with it**.
- `nv-control-core-temperature` can be changed with:
  - `nvidia-settings -q gpucoretemp -t` **but I have noticed in-game stuttering with it**.
  - `nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader` **it seems stutters free but it takes 11-12 milliseconds to execute on my PC**.

I have tested the execution time of the main loop on my computer (with a Ryzen 5 5600):
- If fan speed doesn't need to change it takes around 1.5 milliseconds.
- If fan speed needs to change it takes around 2.5 milliseconds.  
This is something that gets done every second by default (but you can change it with sleep_seconds).

I think that this is pretty fast and probably the next step is to substitute the bash script with another binary calling the functions: **I think that it is unnecessary but maybe I will do it for fun**.

You can compile these binaries yourself, but you need to:
1. Download the nvidia-settings repository: https://github.com/NVIDIA/nvidia-settings;
2. Put the source C files in the `sample` folder;
3. Modify the `Makefile` to compile also the new source code;
4. Execute `make all` and you will have your binaries.

In case this repository gets more attention, I can look to make this process available directly in my repo, since it should all be open source software.

### Comment on different solutions

I have seen many different solutions:
- Some being more simple with just temperature/fan speed steps, no hysteresis... just too simple.
- Some using the nvidia-settings commands causing in game stuttering at regular intervals.
- Some being very complex:
  - Many lines of code doing... to be honest I don't know what.
  - GreenWithEnvy is nice but heavy to just adjust fan speed: 145 megabytes reported by xfce4-taskmanager, my bash script occupies 3.5 megabytes.