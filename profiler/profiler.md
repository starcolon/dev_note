# Profilers

A few choices, preferred are

## Memory Profiler

```bash
pip3 install memory-profiler
```

Run with

```bash
mprof run <EXECUTABLE>
-- It will log memory usage into mprof_XXXXXX.dat
mprof plot 
-- It will pick up the latest dat file to plot
```

## CPU Profiler

```bash
pip3 install scalene
```

Run with

```bash
python3 -m scalene <EXECUTABLE>
```
