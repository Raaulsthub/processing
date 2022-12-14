import java.util.Random;
import java.lang.Math.*;


int [] array; // main unordered array (to be sorted)
int [] aux_array; // used for animation
int [] swaps; // saves all swaps made in quicksort (also for animation)
int swap_iterator;

int debug = 0;
int ordering;


// SETUP

void setup() {
   size(800, 600); // screen size
   
   array = new int[width];
   aux_array = new int[width];
   swaps = new int[width * width];
   swap_iterator = 0;
   ordering = 1;

   for (int i = 0; i < width; i++) {
       array[i] = int(random(height));
       aux_array[i] = array[i];
   }
   
   if (debug == 1) {
       for (int i = 0; i < width; i++) {
         System.out.println(array[i]);
       }
   }
   
   
   quickSort(array, 0, width - 1);
   
   if (debug == 1){
       for (int i = 0; i < width; i++) {
         System.out.println(array[i]);
       }
   }
   
   ordering = 0;
   swap_iterator = 0;
   
}


// RENDER

void draw() {
    background(0);
    for(int i = 0; i < aux_array.length; i++) {
        fill(255);
        stroke(255);
        line(i, height, i, height - aux_array[i]);
    }
    swap(aux_array, swaps[swap_iterator], swaps[swap_iterator + 1]);
    swap_iterator += 2;
    
    // borders
    fill(205,133,63);
    stroke(222,184,135);
    rect(0, 0, width, 30);
    rect(0, 0, 30, height);
    rect(width - 30, 0, width, height);
    rect(0, height - 30, width, height);
    fill(139,69,19);
    rect(0, 0, width, 20);
    rect(0, 0, 20, height);
    rect(width - 20, 0, width, height);
    rect(0, height - 20,  width, height);
    fill(128,0,0);
    rect(0, 0, width, 10);
    rect(0, 0, 10, height);
    rect(width - 10, 0, width, height);
    rect(0, height - 10, width, height);
    
}


// QUICKSORT 

private void quickSort(int[] array, int left, int right) {
  if(right > left) {
    //dividing vector in 3 parts
    int indexPivot = divide(array, left, right);
    // recursive call
    quickSort(array, left, indexPivot - 1);
    // recursive call
    quickSort(array, indexPivot + 1, right);
  }
}



private int divide(int[] array, int left, int right) {
  int pivot, l_ptr, r_ptr = right;
  l_ptr = left + 1;
  pivot = array[left];
  
  while(l_ptr <= r_ptr) {
    while(l_ptr <= r_ptr && array[l_ptr] <= pivot) {
      l_ptr++;
    }
    while(r_ptr >= l_ptr && array[r_ptr] > pivot) {
      r_ptr--;
    }
    if(l_ptr < r_ptr) {
      swap(array, r_ptr, l_ptr);
      l_ptr++;
      r_ptr--;
  }
}
  
   swap(array, left, r_ptr);
   return r_ptr;
}

private void swap(int[] array, int i, int j) {
    int temp = array[i];
    array[i] = array[j];
    array[j] = temp;
    if (ordering == 1) {
        swaps[swap_iterator] = i;
        swap_iterator++;
        swaps[swap_iterator] = j;
        swap_iterator++;
    }
    

    
}
