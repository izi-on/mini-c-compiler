struct Node { int value; struct Node* next; };
void sortList(struct Node* head) {
    int swapped;
    struct Node* ptr;
    struct Node* lptr;
    if (head == 0) return;
    swapped = 1;
    lptr = 0;
    while (swapped) {
        swapped = 0;
        ptr = head;
        while (((*ptr).next) != lptr) {
            if (((*ptr).value) > ((*((*ptr).next)).value)) {
                int temp;
                temp = (*ptr).value;
                (*ptr).value = (*((*ptr).next)).value;
                (*((*ptr).next)).value = temp;
                swapped = 1;
            }
            ptr = (*ptr).next;
        }
        lptr = ptr;
    }
}
int main() {
    struct Node a;
    a.value = 3;
    b.value = 1;
    c.value = 2;
    a.next = &b;
    b.next = &c;
    c.next = 0;
    sortList(&a);
    return 0;
}