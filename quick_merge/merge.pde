import java.util.Arrays;

int [] array; // main unordered array (to be sorted)
int curr_size = 1;                   
int left_start = 0;

void setup() {
   size(800, 600); // screen size
   
   array = new int[width];

   for (int i = 0; i < width; i++) {
       array[i] = int(random(height));
   }
}

void mergeSort(int arr[], int n) {
    
    int mid = Math.min(left_start + curr_size - 1, n - 1);
        
    int right_end = Math.min(left_start + 2 * curr_size - 1, n - 1);
        
    merge(arr, left_start, mid, right_end);
    
    if (curr_size <= n - 1) {
        left_start += 2 * curr_size;
        if (left_start >= n - 1) {
            curr_size = 2 * curr_size;
            left_start = 0;
        }
    } else {
        println("Finished!");
        noLoop();
    }
}

void draw() {
    background(0);
    for(int i = 0; i < array.length; i++) {
        fill(255);
        stroke(255);
        line(i, height, i, height - array[i]);
    }
    
    // iterative merge sort algorithm
    mergeSort(array, width);
        
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
      
void merge(int arr[], int l, int m, int r) {
  
        int i, j, k;
        int n1 = m - l + 1;
        int n2 = r - m;
      
        int L[] = new int[n1];
        int R[] = new int[n2];
      
        for (i = 0; i < n1; i++)
            L[i] = arr[l + i];
        for (j = 0; j < n2; j++)
            R[j] = arr[m + 1+ j];
      
        i = 0;
        j = 0;
        k = l;
        while (i < n1 && j < n2)
        {
            if (L[i] <= R[j])
            {
                arr[k] = L[i];
                i++;
            }
            else
            {
                arr[k] = R[j];
                j++;
            }
            k++;
        }
      
        while (i < n1)
        {
            arr[k] = L[i];
            i++;
            k++;
        }
      
        while (j < n2)
        {
            arr[k] = R[j];
            j++;
            k++;
        }
}
