use Math;

//config const sample = 1000;
config const sample = 100;
config const width = 80, height = 40;
config const maxIter = 1000;

proc mandelbrot(re: real, im: real): int {
  var x = 0.0, y = 0.0;
  var iterationCount:int = 0; // Initialize value

  while (x*x + y*y <= 4.0) && (iterationCount < maxIter) {
    const xTemp = x*x - y*y + re;
    y = 2.0*x*y + im;
    x = xTemp;
    iterationCount += 1; // Use shorthand addition for clarity
  }

  return iterationCount;
}

proc main() {
  const xMin = -2.0, xMax = 1.0;
  const yMin = -1.0, yMax = 1.0;
  var Color: [0..#width] string;

  var detailed_width = width * sample;
  var detailed_height = height * sample;

  for j in 0..#detailed_height {
    const im = yMax - (yMax - yMin) * j / detailed_height;
    // Calculate the imaginary part for the current row in parallel
    forall i in 0..#detailed_width {
      const re = xMin + (xMax - xMin) * i / detailed_width;
      const iterationCount = mandelbrot(re, im);
      var idx: int;
      if((i % sample == 0) && (j % sample == 0)) {
        // Only calculate the color for every 'sample' pixel
        idx = i / sample;
        if iterationCount == maxIter then
          Color[idx] = "#";
        else if iterationCount > maxIter/2 then
          Color[idx] = "+";
        else if iterationCount > maxIter/4 then
          Color[idx] = ".";
        else
          Color[idx] = " ";
      }
    }
    // Print the row of colors
    if(j % sample == 0) {
        for i in 0..#width {
        write(Color[i]);
        }
        writeln();
    } 
  }
}