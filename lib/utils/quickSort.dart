class QuickSort {
  int partition(List<int> array, int low, int high) {
    int pivot = array[high];
    int i = (low - 1);

    for (int j = low; j < high; j++) {
      if (array[j] <= pivot) {
        i++;
        int temp = array[i];
        array[i] = array[j];
        array[j] = temp;
      }
    }
    int temp = array[i + 1];
    array[i + 1] = array[high];
    array[high] = temp;
    return (i + 1);
  }

  void quickSort(List<int> array, int low, int high) {
    if (low < high) {
      int pi = partition(array, low, high);

      quickSort(array, low, pi - 1);

      quickSort(array, pi + 1, high);
    }
  }

  // List<int> sortedArray = <int>[];
  List<int> sort(List<int> array) {
    int size = array.length;
    QuickSort qs = new QuickSort();
    qs.quickSort(array, 0, size - 1);
    //print(array);
    return array;
  }
}
