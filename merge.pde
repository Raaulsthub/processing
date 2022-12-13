import java.util.Random;
import java.lang.Math.*;


int size = 800;
int range = 100;
int [] array;// main unordered array (to be sorted)

void setup() {
   size(800, 600); // screen size
   
   array = new int[size];
   
   Random rand = new Random();

   for (int i = 0; i < width; i++) {
       array[i] = int(random(height));
   }
   
   for (int i = 0; i < size; i++) {
       System.out.println(array[i]);
   }
   
   //mergeSort(array, size);
   quickSort(array, 0, size - 1);
   
   for (int i = 0; i < size; i++) {
       System.out.println(array[i]);
   }
}

void draw() {
    background(0);
    for(int i = 0; i < array.length; i++) {
        stroke(255);
        line(i, height, i, height - array[i]);
    }
}


// merge sort 

// merging function
void merge(int[] array, int[] l_partition, int[] r_partition, int median, int last_index) {
 
    int i = 0, j = 0, k = 0;
    while (i < median && j < last_index) {
        if (l_partition[i] <= r_partition[j]) {
            array[k++] = l_partition[i++];
        }
        else {
            array[k++] = r_partition[j++];
        }
    }
    while (i < median) {
        array[k++] = l_partition[i++];
    }
    while (j < last_index) {
        array[k++] = r_partition[j++];
    }
}

// recursive main function
void mergeSort(int[] array, int n) {
    if (n < 2) {
        return;
    }
    int mid = n / 2;
    int[] l = new int[mid]; // l_partition
    int[] r = new int[n - mid]; // r_partition

    // copying main array into auxiliar arrays
    for (int i = 0; i < mid; i++) {
        l[i] = array[i];
    }
    for (int i = mid; i < n; i++) {
        r[i - mid] = array[i];
    }
    
    // recursive calls (divide the processing in two)
    mergeSort(l, mid);
    mergeSort(r, n - mid);

    // merging call
    merge(array, l, r, mid, n - mid);
}


// quick sort

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
}
