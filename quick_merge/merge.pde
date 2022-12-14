import java.util.Random;
import java.lang.Math.*;


int [] array; // main unordered array (to be sorted)
int [][] animation; // arrays generated during merge sort
int line_itr;

int debug = 0;


// SETUP

void setup() {
   size(800, 600); // screen size
   
   array = new int[width];
   animation = new int[width + 1][width];
   line_itr = 1;

   for (int i = 0; i < width; i++) {
       array[i] = int(random(height));
       animation[0][i] = array[i];
   }
   
   if (debug == 1) {
       for (int i = 0; i < width; i++) {
         //System.out.println(array[i]);
       }
   }
   
   
   mergeSort(array, width);
   
   if (debug == 1){
       for (int i = 0; i < width; i++) {
         System.out.println(array[i]);
       }
   }
   
   line_itr = 0;
   
   
}

// RENDER

void draw() {
    background(0);
    for(int i = 0; i < array.length; i++) {
        fill(255);
        stroke(255);
        line(i, height, i, height - animation[line_itr][i]);
    }
    
    line_itr++;
    
    
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



// merge sort 

// merging function
void merge(int[] array_, int[] l_partition, int[] r_partition, int median, int last_index) {
 
    int i = 0, j = 0, k = 0;
    while (i < median && j < last_index) {
        if (l_partition[i] <= r_partition[j]) {
            array_[k++] = l_partition[i++];
        }
        else {
            array_[k++] = r_partition[j++];
        }
    }
    while (i < median) {
        array_[k++] = l_partition[i++];
    }
    while (j < last_index) {
        array_[k++] = r_partition[j++];
    }
}

// recursive main function
void mergeSort(int[] array_, int n) {
    if (n < 2) {
        return;
    }
    int mid = n / 2;
    int[] l = new int[mid]; // l_partition
    int[] r = new int[n - mid]; // r_partition

    // copying main array into auxiliar arrays
    for (int i = 0; i < mid; i++) {
        l[i] = array_[i];
    }
    for (int i = mid; i < n; i++) {
        r[i - mid] = array_[i];
    }
    
    // recursive calls (divide the processing in two)
    mergeSort(l, mid);
    mergeSort(r, n - mid);

    // merging call
    merge(array_, l, r, mid, n - mid);
    
    for (int itr = 0; itr < width; itr++) {
        animation[line_itr][itr] = array[itr];
    }
    line_itr++;
    
}
