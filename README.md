# Mandelbrot for Chapel

# Compiling and Running 
## Building the Application
```
chpl mandel.chpl
```
## Running the Application
```
./mandel
```
## Parallelism Control
### Run on all threads
```
export CHPL_RT_NUM_THREADS_PER_LOCALE="MAX_LOGICAL"
```
### Run on all cores 
```
export CHPL_RT_NUM_THREADS_PER_LOCALE="MAX_PHYSICAL"
```

## Watching Parallelism
```
htop
```

# Issues
1) Forall only goes 8 way parallel on a AMD processor with 8 cores and 16 threads (Resolved)
2) High values of sample undermine parallelism

# Enhancement Wanted
1) GPU Support
